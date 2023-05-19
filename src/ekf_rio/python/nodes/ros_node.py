#!/usr/bin/python

import rospy
from ekf_rio.python.ekf_rio_ros import *

knode_name = 'ekf_rio'

if __name__ == '__main__':
    rospy.init_node(knode_name)
    ekfrio = EKF_RIO()
    ekfrio.run() 


    