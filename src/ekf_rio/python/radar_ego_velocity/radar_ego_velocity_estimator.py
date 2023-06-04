#!/usr/bin/python
import os 
import sys
current_directory = os.path.dirname(os.path.abspath(__file__))
sys.path.append(current_directory)
from sensor_msgs.msg import PointCloud2
from enum import Enum
import numpy as np
import rospy
from radar_ego_velocity_config import *
from radar_point_cloud import *
from scipy.linalg import svd, cho_solve, cho_factor
from scipy.odr import Model, RealData, ODR


class REEIndices(Enum):
    azimuth = 0
    elevation = 1
    x_r = 2
    y_r = 3
    z_r = 4
    peak_db = 5
    r_x = 6
    r_y = 7
    r_z = 8
    v_d = 9
    noise_db = 10

class RadarEgoVelocityEstimator:
    
    #constructor
    def __init__(self):
        self.ransac_iter = 0
        self.config_ = Radar_ego_velocity_config()
        self.kPrefix = '[RadarEgoVelocityEstimator]:'
        self.setRansacIter()
        rospy.loginfo('ransac iteration is' + str(self.ransac_iter))
        # print('iteration count', self.ransac_iter)
    
    # return success and inlier msg in PointCloud2
    def estimate0(self, radar_scan_msg, v_r, P_v_r):
        inlier_radar_msg = PointCloud2()
        return self.estimate2(radar_scan_msg, v_r, P_v_r, inlier_radar_msg)
    
    def estimate1(self, radar_scan_msg, v_r, sigma_v_r):
        P_v_r = np.eye(3)
        inlier_radar_msg = PointCloud2()
        success, inlier_radar_msg = self.estimate2(radar_scan_msg, v_r, P_v_r, inlier_radar_msg)
        sigma_v_r[0] = P_v_r[0][0]
        sigma_v_r[1] = P_v_r[1][1]
        sigma_v_r[2] = P_v_r[2][2]
        return success, inlier_radar_msg

    # return success and inlier msg in PointCloud2
    def estimate2(self, radar_scan_msg, v_r, P_v_r, inlier_radar_msg):
        radar_scan_inlier = []
        success = self.estimate4(radar_scan_msg, v_r, P_v_r, radar_scan_inlier)
        inlier_radar_msg = pclToPcl2msg(radar_scan_inlier, radar_scan_msg.header)[0]
        return success, inlier_radar_msg
    
    # there is conversion between pcl and std point clouds in roscpp
    def estimate3(self, radar_scan_msg, v_r, sigma_v_r, inlier_radar_msg):
        P_v_r = np.eye(3)
        radar_scan_inlier = []
        success = self.estimate4(radar_scan_msg, v_r, P_v_r, radar_scan_inlier)
        inlier_radar_msg = pclToPcl2msg(radar_scan_inlier, radar_scan_msg.header)[0]
        sigma_v_r[0] = P_v_r[0][0]
        sigma_v_r[1] = P_v_r[1][1]
        sigma_v_r[2] = P_v_r[2][2]
        return success, inlier_radar_msg

    def estimate4(self, rdar_scan_msg, v_r, P_v_r, inlier_radar, C_stab_r = np.eye(3)):
        radar_scan = []
        success = False

        if pcl2msgToPcl(rdar_scan_msg, radar_scan):
            valid_target = []
            
            for i in range(len(radar_scan)):
                target = radar_scan[i]
                # print(target.x, target.y, target.z, target.snr_db, target.v_doppler_mps, target.noise_db)
                r = np.linalg.norm((target.x, target.y, target.z))

                azimuth = np.arctan2(target.y, target.x) - np.pi/2
                elevation = np.arctan2(np.sqrt(target.x * target.x + target.y * target.y), target.z) - np.pi/2

                #check condition
                if r > self.config_.min_dist and r < self.config_.max_dist and target.snr_db > self.config_.min_db \
                and np.abs(azimuth) < np.deg2rad(self.config_.azimuth_thresh_deg) and \
                np.abs(elevation) < np.deg2rad(self.config_.elevation_thresh_deg):
                    p_stab = C_stab_r @ np.array([target.x, target.y, target.z])
                    if p_stab[2] > self.config_.filter_min_z and p_stab[2] < self.config_.filter_max_z:
                        v = np.array([azimuth, elevation, target.x, target.y, target.z, target.snr_db, target.x / r, target.y / r, target.z / r, \
                                      -target.v_doppler_mps * self.config_.doppler_velocity_correction_factor, target.noise_db])
                        valid_target.append(v)

        if len(valid_target) > 2:
            v_dopplers = []
            for v in valid_target: v_dopplers.append(np.abs(v[REEIndices.v_d.value]))
            n = int(len(v_dopplers) * (1.0 - self.config_.allowed_outlier_percentage))
            v_dopplers.sort()
            median = v_dopplers[n]
            # print(n, v_dopplers)
            # print('med', median, 'thresh', self.config_.thresh_zero_velocity)
            if median < self.config_.thresh_zero_velocity:
                rospy.loginfo('Zero velocity detected')
                v_r[:] = np.zeros(3)[:]
                P_v_r[:, :] = np.zeros(P_v_r.shape)
                P_v_r[0][0] = np.square(self.config_.sigma_zero_velocity_x)
                P_v_r[1][1] = np.square(self.config_.sigma_zero_velocity_y)
                P_v_r[2][2] = np.square(self.config_.sigma_zero_velocity_z) 

                for item in valid_target:
                    if item[REEIndices.v_d.value] < self.config_.thresh_zero_velocity:
                        inlier_radar.append(toRadarPointCloudType(item)) 
                success = True
                
            else:
                #LSQ velocity estimation
                radar_data = np.zeros((len(valid_target), 4))
                idx = 0
                for v in valid_target:
                    # print('data:', np.array([v[REEIndices.r_x.value], v[REEIndices.r_y.value], v[REEIndices.r_z.value], v[REEIndices.v_d.value]]))
                    radar_data[idx][:] = np.array([v[REEIndices.r_x.value], v[REEIndices.r_y.value], v[REEIndices.r_z.value], v[REEIndices.v_d.value]])
                    idx += 1 

                if self.config_.use_ransac:
                    success , inlier_idx_best = self.solve3DLsqRansac(radar_data, v_r, P_v_r)

                    for idx in inlier_idx_best:
                        inlier_radar.append(toRadarPointCloudType(valid_target[idx]))

                    if success and self.config_.use_odr and np.linalg.norm(v_r) > self.config_.min_speed_odr and len(inlier_idx_best) > 10:
                        radar_data_inlier = np.zeros((len(valid_target), 4))
                        for i in range(len(inlier_idx_best)):
                            radar_data_inlier[i][:] = radar_data[inlier_idx_best[i]][:]
                        success = self.solve3DOdr(radar_data_inlier, v_r, P_v_r)
                else:
                    for item in valid_target: inlier_radar.append(toRadarPointCloudType(item))
                    success = self.solve3DLsq(radar_data, v_r, P_v_r)
                    if success and self.config_.use_odr:
                        success = self.solve3DOdr(radar_data, v_r, P_v_r)
        return success
            
    #solvers
    def solve3DLsqRansac(self, radar_data, v_r, P_v_r):
        H_all = radar_data[:,:3]
        y_all = radar_data[:,3]
        idx = np.arange(radar_data.shape[0])
        inlier_idx_best = []

        if radar_data.shape[0] >= self.config_.N_ransac_points:
            for k in range(self.ransac_iter):
                np.random.shuffle(idx)
                radar_data_iter = np.zeros((self.config_.N_ransac_points, 4))

                for i in range(self.config_.N_ransac_points): radar_data_iter[i][:] = radar_data[idx[i]][:]
                
                if self.solve3DLsq(radar_data_iter, v_r, P_v_r, False):
                    err = np.abs(y_all - H_all @ v_r)
                    inlier_idx = []
                    for j in range(err.shape[0]):
                        if err[j] < self.config_.inlier_thresh:
                            inlier_idx.append(j)
                    if len(inlier_idx) > len(inlier_idx_best):
                        inlier_idx_best = inlier_idx
        
        if len(inlier_idx_best) > 0 :
            radar_data_inlier = np.zeros((len(inlier_idx_best), 4))
            for i in range(len(inlier_idx_best)): radar_data_inlier[i][:] = radar_data[inlier_idx_best[i]][:]
            return self.solve3DLsq(radar_data_inlier, v_r, P_v_r, True), inlier_idx_best
        
        return False, inlier_idx_best
    
    def solve3DLsq(self, radar_data, v_r, P_v_r, estimate_sigma = True):
        H = np.zeros((radar_data.shape[0], 3))
        H = radar_data[:,:3]
        HTH = H.T @ H
        y = radar_data[:,3]
        _, singular_values, _ = svd(HTH)
        # Condition number is the ratio of the first singular value to the last one
        if singular_values[-1] != 0:
            cond = singular_values[0] / singular_values[-1]
        else:
            cond = np.inf

        if np.abs(cond) < 1.0e3:      
            if self.config_.use_cholesky_instead_of_bdcsvd:
                c, low = cho_factor(HTH)
                v_r[:] = cho_solve((c, low), np.dot(H.T, y))[:]

            else:
                # Assuming H is your matrix and y is the vector
                u, s, vh = np.linalg.svd(H, full_matrices=False)
                # Compute Moore-Penrose Pseudoinverse
                pseudo_inverse = vh.T @ np.linalg.inv(np.diag(s)) @ u.T
                # Solve the system
                v_r[:] = (pseudo_inverse @ y)[:]    
                
            if estimate_sigma:
                e = H @ v_r - y
                P_v_r[:,:] = ((e.T @ e) * np.linalg.inv(HTH) / (H.shape[0] - 3))[:,:]
                sigma_v_r = np.array([P_v_r[0, 0], P_v_r[1, 1], P_v_r[2, 2]])
                offset = np.array([self.config_.sigma_offset_radar_x, self.config_.sigma_offset_radar_y, self.config_.sigma_offset_radar_z]) ** 2
                P_v_r += np.diag(offset)
                # Check diagonal for valid estimation result
                if sigma_v_r[0] >= 0.0 and sigma_v_r[1] >= 0.0 and sigma_v_r[2] >= 0.0:
                    sigma_v_r = np.sqrt(sigma_v_r)
                    if sigma_v_r[0] < self.config_.max_sigma_x and sigma_v_r[1] < self.config_.max_sigma_y and sigma_v_r[2] < self.config_.max_sigma_z:
                        return True
            else:
                return True
            
        return False
    

    def solve3DOdr(self, radar_data, v_r, P_v_r):
        n = radar_data.shape[0]
        H = radar_data[:, :3]
        y = radar_data[:, 3]

        sigma_y = self.config_.sigma_v_d * np.ones(n)

        sigma_x = np.zeros((n, 3))
        for k in range(n):
            sigma_x[k, :] = np.radians(self.config_.model_noise_offset_deg) + \
                            np.radians(self.config_.model_noise_scale_deg) * (1.0 - np.abs(H[k, :]))

        v_r_odr[:] = v_r[:]  # Assuming v_r exists

        # Here, we need to define a function for our model and use scipy's ODR functionality.
                # Without knowing exactly what model you're fitting, this is a placeholder.
        def f(B, x):
            # ... your model here, e.g., a simple linear model:
            return B[0] * x[0] + B[1] * x[1] + B[2] * x[2]

        linear_model = Model(f)
        data = RealData(H.T, y, sx=sigma_x, sy = sigma_y)
        odr = ODR(data, linear_model, beta0= [0, 0, 0])
        output = odr.run()
        v_r_odr = output.beta
        sigma_odr = output.sd_beta
        cov_v_r = output.cov_beta

        v_r[:] = v_r_odr[:]
        P_v_r[:] = cov_v_r[:]
    
        offset = np.array([self.config_.sigma_offset_radar_x, self.config_.sigma_offset_radar_y, self.config_.sigma_offset_radar_z]) ** 2
        P_v_r += np.diag(offset)

        if sigma_odr[0] < self.config_.max_sigma_x and sigma_odr[1] < self.config_.max_sigma_y and sigma_odr[2] < self.config_.max_sigma_z:
            return True

        return False

    #ransac iteration number
    def setRansacIter(self):
        self.ransac_iter = int(abs(np.log(1.0 - self.config_.success_prob) / np.power(1.0 - self.config_.outlier_prob, self.config_.N_ransac_points)))

# pcl point to rodar point cloud
def toRadarPointCloudType(item):
    point = RadarPointCloudType()
    point.x = item[REEIndices.x_r.value]
    point.y = item[REEIndices.y_r.value]
    point.z = item[REEIndices.z_r.value]
    point.v_doppler_mps = -item[REEIndices.v_d.value]
    point.snr_db = item[REEIndices.peak_db.value]
    point.noise_db = item[REEIndices.noise_db.value]
    return point



