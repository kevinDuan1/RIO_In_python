#!/usr/bin/python
from enum import Enum
import rospy

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