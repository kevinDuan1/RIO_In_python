#!/usr/bin/python

import rospy
import yaml
from ekf_rio.python.ekf_rio_ros import *
from ekf_rio.python.ros_helper import *

KnodeName = 'ekf_rio'
KPrefix = '[' + KnodeName + ']'

if __name__ == '__main__':
    rospy.init_node(KnodeName)
    ekf_rio = EKF_RIO()

    bag_start = -1
    getRosParameter(KPrefix, RosParameterType.Optional, 'bag_start', bag_start)

    bag_duration = -1
    getRosParameter(KPrefix, RosParameterType.Optional, 'bag_duration', bag_duration)
    if bag_duration < 0:
        bag_duration = 1.0e6

    sleep_ms = -1
    getRosParameter(KPrefix, RosParameterType.Optional, 'sleep_ms', sleep_ms)

    rosbag_path = ''
    if None != getRosParameter(KPrefix, RosParameterType.Required, 'rosbag_path', rosbag_path):
        ekf_rio.runFromRosbag(rosbag_path, bag_start, bag_duration, sleep_ms)
