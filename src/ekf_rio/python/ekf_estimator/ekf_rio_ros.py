#!/usr/bin/python
import numpy as np
from ekf_rio_filter import *
from radar_ego_velocity.radar_ego_velocity_estimator import RadarEgoVelocityEstimator
from utils.data_types import *
from utils.ros_helper import *
from ekf_config import *
from sensor_msgs.msg import PointCloud2
from std_msgs.msg import Header
import rosbag

class EKF_RIO:

    #init 
    def __init__(self):
        self.ekf_rio_filter_ = None
        self.imu_init_ = [] # list of imuDataStamped
        self.last_imu_ = None
        self.imu_data_ = None
        self.radar_w_queue_ = [] # list of imuDataStamped
        self.queue_imu_ = [] # queue for imuDataStamped
        self.queue_baro_ = [] 
        self.queue_radar_ = []
        self.queue_radar_trigger_ = []
        self.queue_global_pose = []
        self.config_ = Ekf_Rio_config()
        self.baro_altimeter_ = BaroAltimeter()
        self.baro_initialized_ = False
        self.baro_init_vec_ = []
        self.initialized_ = False
        self.radar_ego_velocity_ = RadarEgoVelocityEstimator()
        self.last_timestamp_pub_ = rospy.Time(0)
        self.last_timestamp_pose_pub_ = rospy.Time(0)
        self.filter_start_stamp_ = None
        self.ts = []; 
        self.position = []; 
        self.poses = []; self.velocity = []
    #path: bagpath
    #bag_start skip the first bag_start seconds of the rosbag
    #bag_duration process only until bag_start + duration
    #sleep_ms sleep for ms
    def runFromRosbag(self, path):
        bag = rosbag.Bag(path)
        topics = ['/sensor_platform/imu', '/sensor_platform/baro', '/sensor_platform/radar/scan', '/sensor_platform/radar/trigger']
        
        for topic, msg, timestamp in bag.read_messages(topics=topics):
            if topic == '/sensor_platform/imu':
                self.callbackIMU(msg)

            elif topic == '/sensor_platform/baro':
                self.callbackBaroAltimter(msg)

            elif topic == '/sensor_platform/radar/scan':
                self.callbackRdarScan(msg)

            elif topic == '/sensor_platform/radar/trigger':
                self.callbackRadarTrigger(msg)

            self.iterate()

            # if self.ekf_rio_filter_ is not None and self.ekf_rio_filter_.getTimestamp() != self.last_timestamp_pub_: 
            #     self.ts.append( self.last_timestamp_pub_.to_sec()); self.position.append(self.ekf_rio_filter_.getNavigationSolution().get_position_n_b())
            #     self.poses.append(self.ekf_rio_filter_.getNavigationSolution().get_quaternion_n_b())
            #     self.velocity.append(self.ekf_rio_filter_.getNavigationSolution().get_velocity_ros())
        return np.array(self.ts), np.array(self.position), np.array(self.poses), np.array(self.velocity)
    
    def iterate(self):
        
        #check imu
        if len(self.queue_imu_) > 0:
            self.imu_data_ = self.queue_imu_[0]
            self.queue_imu_.pop(0)

            if not self.initialized_:
                self.initIMU(self.imu_data_)
                
            else:
                if not self.ekf_rio_filter_.propagate(self.imu_data_):
                    print('propagation failed !')
                
                if (1.0 / (self.imu_data_.time_stamp - self.last_timestamp_pub_).to_sec() ) < self.config_.publisher_rate:
                    self.last_timestamp_pub_ = self.imu_data_.time_stamp
                    self.ts.append(self.last_timestamp_pub_.to_sec()); self.position.append(self.ekf_rio_filter_.getNavigationSolution().get_position_n_b())
                    self.poses.append(self.ekf_rio_filter_.getNavigationSolution().get_quaternion_n_b())
                    self.velocity.append(self.ekf_rio_filter_.getNavigationSolution().get_velocity_ros())
            
            if len(self.radar_w_queue_) > 0 and (self.radar_w_queue_[-1].time_stamp - self.radar_w_queue_[0].time_stamp).to_sec() < \
            self.config_.radar_frame_ms / 1.0e-3:
                self.radar_w_queue_.append(self.imu_data_)

        if len(self.queue_baro_) > 0:
            baro_msg = self.queue_baro_[0]
            if not self.baro_initialized_:
                self.baro_init_vec_.append(self.baro_altimeter_.calculate_rel_neg_height(baro_msg))
                self.queue_baro_.pop(0)
            
            elif self.ekf_rio_filter_.getTimestamp() >= baro_msg.header.stamp:
                self.queue_baro_.pop(0)
                if self.config_.altimeter_update and self.initialized_:
                    h_real = self.baro_altimeter_.calculate_rel_neg_height(baro_msg)
                    self.ekf_rio_filter_.updateAltimeter(h_real, self.config_.sigma_altimeter)

        if len(self.queue_radar_trigger_) > 0:
            if not self.initialized_ or not self.config_.radar_update or self.config_.run_without_radar_trigger:
                self.queue_radar_trigger_.pop(0)
            else:
                radar_trigger_msg = self.queue_radar_trigger_[0]
                time_diff_filter = self.ekf_rio_filter_.getTimestamp().to_sec() - radar_trigger_msg.stamp.to_sec()
                radar_trigger_to_clone_delay = 0.5 * self.config_.radar_frame_ms / 1.0e3

                if abs(time_diff_filter) <= self.imu_data_.dt / 2:
                    self.radar_w_queue_.clear()
                    self.radar_w_queue_.append(self.imu_data_)
                    # catch corner case
                    if radar_trigger_to_clone_delay < self.imu_data_.dt:
                        self.ekf_rio_filter_.addRadarStateClone(radar_trigger_msg.stamp)
                        self.queue_radar_trigger_.pop(0)

                elif abs(time_diff_filter - radar_trigger_to_clone_delay) < self.imu_data_.dt:
                    # compensate for the radar frame time ("exposure time" of the radar scan) --> center clone on radar scan
                    self.ekf_rio_filter_.addRadarStateClone(radar_trigger_msg.stamp)
                    self.queue_radar_trigger_.pop(0)

                elif time_diff_filter - radar_trigger_to_clone_delay > self.imu_data_.dt:
                    self.queue_radar_trigger_.pop(0)

        if len(self.queue_radar_) > 0:
            
            if not self.initialized_ or not self.config_.radar_update:
                self.queue_radar_.pop(0)
            
            else:
                if len(self.queue_radar_) > 1:
                    if self.queue_radar_[0].header.stamp == self.queue_radar_[-1].header.stamp:
                        self.queue_radar_.pop(0)
                    else:
                        print("Radar data queue size > 1: ", " this should not happen!")
                
                radar_data_msg = self.queue_radar_[0]
                
                if self.config_.run_without_radar_trigger or radar_data_msg.header.stamp.to_sec() == 0:
                    radar_data_msg.header.stamp = self.ekf_rio_filter_.getTimestamp()

                if self.ekf_rio_filter_.getTimestamp().to_sec() + self.config_.radar_frame_ms / 1.0e3 >= radar_data_msg.header.stamp.to_sec():
                    
                    if self.ekf_rio_filter_.getTimestamp().to_sec() - radar_data_msg.header.stamp.to_sec() > 1.0 / self.config_.radar_rate:
                        print("Did not received a trigger for the radar data. Rejecting!")
                        self.queue_radar_.pop(0)
                    
                    else:

                        if self.config_.run_without_radar_trigger:
                            self.ekf_rio_filter_.addRadarStateClone(radar_data_msg.header.stamp)
                        
                        time_diff_clone = self.ekf_rio_filter_.getRadarCloneState().trigger_time_stamp.to_sec() - radar_data_msg.header.stamp.to_sec()
                        # print(np.abs(time_diff_clone))
                        if np.abs(time_diff_clone) < 1.0 / self.config_.radar_rate:
                            self.queue_radar_.pop(0)
                            w_mean = np.zeros(3)
                            if len(self.radar_w_queue_) > 0:
                                for imu in self.radar_w_queue_: 
                                    w_mean += imu.w_b_ib
                                w_mean /= len(self.radar_w_queue_)
                            else:
                                w_mean = self.imu_data_.w_b_ib

                            v_r, sigma_v_r = np.zeros(3), np.eye(3) # Assuming these values are vectors

                            flag, inlier_radar_scan = self.radar_ego_velocity_.estimate0(radar_data_msg, v_r, sigma_v_r)
                            
                            if flag:
                                valid = False
                                if self.config_.use_w:
                                    valid = self.ekf_rio_filter_.updateRadarEgoVelocity(v_r, sigma_v_r, w_mean, self.config_.outlier_percentil_radar)
                                else:
                                    valid = self.ekf_rio_filter_.updateRadarEgoVelocity(
                                        v_r, sigma_v_r, np.array([0, 0, 0]), self.config_.outlier_percentil_radar)

                            self.ekf_rio_filter_.removeRadarStateClone()
                        # else:
                        #     print("Did not process radar data due to time diff: ")


    def initIMU(self, imu_data):
        self.imu_init_.append(imu_data)

        T_init_so_far = self.imu_init_[-1].time_stamp.to_sec()- self.imu_init_[0].time_stamp.to_sec()
        
        if T_init_so_far > self.config_.T_init:
            baro_h_0 = 0.0
            if self.config_.altimeter_update:
                if len(self.baro_init_vec_) > 0:
                    for b in self.baro_init_vec_:
                        baro_h_0 += b
                    baro_h_0 = baro_h_0 / len(self.baro_init_vec_) 
                    self.baro_initialized_ = True
            
            self.ekf_rio_filter_ = EkfRioFilter(self.imu_init_, baro_h_0)
            self.initialized_ = True
            print(f'IMU initialized! and T init is {T_init_so_far}')
            self.filter_start_stamp_ = self.ekf_rio_filter_.getTimestamp()
        # else:
        #     print('imu init waiting')

        return self.initialized_
       
    #imu_msg 
    def callbackIMU(self, imu_msg):
        dt = 2.4e-3
        if self.last_imu_ is not None and np.abs(self.last_imu_.dt) > 1.0e-6:
            dt = imu_msg.header.stamp.to_sec() - self.last_imu_.time_stamp.to_sec()
        self.last_imu_ = ImuDataStamped(imu_msg= imu_msg, dt=dt)
        self.queue_imu_.append(self.last_imu_)

    def callbackBaroAltimter(self, baro_msg):
        self.queue_baro_.append(baro_msg)

    def callbackRdarScan(self, radar_msg):
        self.queue_radar_.append(radar_msg)

    def callbackRadarTrigger(self, trigger_msg):
        self.queue_radar_trigger_.append(trigger_msg)

    #==============================================
    def printStats(self):
        pass
