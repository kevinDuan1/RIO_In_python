#!/usr/bin/python
from enum import Enum
import numpy as np
import rospy
from scipy.spatial.transform import Rotation as R

class RosParameterType(Enum):
    Required = 1
    Recommended = 2
    Optional = 3

# function to receive parameters from the parameter server
def getRosParameter(Kprefix, param_type, param_name, param):
    if not rospy.has_param(param_name):
        #Optional
        if param_type == RosParameterType.Optional:
            rospy.loginfo(Kprefix + '<' + param_name + '> is optional but not configured using default value \
                          ' + param)
            rospy.set_param(param_name, param)

        #Recommended
        elif param_type == RosParameterType.Recommended:
            rospy.logwarn(Kprefix + '<' + param_name + '> is recommeded but not configured using default value \
                          ' + param)
            rospy.set_param(param_name, param)

        #Required
        else:
            rospy.logerr(Kprefix + '<' + param_name + '> is required')
            return None
    else:
        param = rospy.get_param(param_name)

    return param

# init angle
def initFromAcc(acc_mean, gravity):
    attitude = np.zeros(3)
    attitude[0] = -1 * np.arctan2(acc_mean[1], -acc_mean[2]) #yaw
    attitude[1] = np.arcsin(np.clip(acc_mean[0] / gravity, -1.0 + np.finfo(float).eps, 1.0 - np.finfo(float).eps))
    return attitude

def skewVec(v):
    S = np.array([[0, -v[2], v[1]], [v[2], 0, -v[0]], [-v[1], v[0], 0]])
    return S

#quaternionMultiplicationHamilton
def quaternionMultiplicationHamilton(q, p):
    q_v = np.zeros(3)
    p_v = np.zeros(3)
    q_v[:3] = q[:3]
    p_v[:3] = p[:3]

    q_p_w = p[3] * q[3] - q_v.T @ p_v
    q_p_ = q[3] * p_v + p[3] * q_v + skewVec(q_v) @ p_v
    return R.from_quat(np.array([q_p_[0], q_p_[1], q_p_[2], q_p_w])).as_quat()