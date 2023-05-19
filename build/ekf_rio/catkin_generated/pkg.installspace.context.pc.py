# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "message_runtime;rosbag;roscpp;angles;dynamic_reconfigure;tf2_ros;tf2_eigen;rio_utils;radar_ego_velocity_estimator".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lekf_rio".split(';') if "-lekf_rio" != "" else []
PROJECT_NAME = "ekf_rio"
PROJECT_SPACE_DIR = "/home/ypandos/work/rostest/install"
PROJECT_VERSION = "1.0.0"
