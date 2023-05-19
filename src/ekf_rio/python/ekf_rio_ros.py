#!/usr/bin/python

class EKF_RIO:

    #init 
    def __init__(self):
        return
    
    def run(self):
        return
    
    #path: bagpath
    #bag_start skip the first bag_start seconds of the rosbag
    #bag_duration process only until bag_start + duration
    #sleep_ms sleep for ms
    def runFromRosbag(self, path, bag_start, bag_duration, sleep_ms):
        return
    
    def iterate(self):
        pass

    def initIMU(self, imu_data):
        pass

    def reconfigureCallback(self, config, level):
        pass
    
    #imu_msg imuConstptr
    def callbackIMU(self, imu_msg):
        pass

    def callbackBaroAltimter(self, baro_msg):
        pass

    def callbackRdarScan(self, radar_msg):
        pass

    def callbackRadarTrigger(self, trigger_msg):
        pass
    #==============================================

    def publish(self):
        pass

    def printStats(self):
        pass

    #variables

    #Substribers

    #Publishers

    #filter
