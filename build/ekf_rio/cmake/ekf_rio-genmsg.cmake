# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ekf_rio: 2 messages, 0 services")

set(MSG_I_FLAGS "-Iekf_rio:/home/ypandos/work/rostest/src/ekf_rio/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Iroscpp:/opt/ros/noetic/share/roscpp/cmake/../msg;-Idynamic_reconfigure:/opt/ros/noetic/share/dynamic_reconfigure/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ekf_rio_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioCovariance.msg" NAME_WE)
add_custom_target(_ekf_rio_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ekf_rio" "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioCovariance.msg" "std_msgs/Header:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioState.msg" NAME_WE)
add_custom_target(_ekf_rio_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ekf_rio" "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioState.msg" "std_msgs/Header:geometry_msgs/Vector3:geometry_msgs/Quaternion"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ekf_rio
  "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioCovariance.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ekf_rio
)
_generate_msg_cpp(ekf_rio
  "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ekf_rio
)

### Generating Services

### Generating Module File
_generate_module_cpp(ekf_rio
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ekf_rio
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ekf_rio_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ekf_rio_generate_messages ekf_rio_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioCovariance.msg" NAME_WE)
add_dependencies(ekf_rio_generate_messages_cpp _ekf_rio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioState.msg" NAME_WE)
add_dependencies(ekf_rio_generate_messages_cpp _ekf_rio_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ekf_rio_gencpp)
add_dependencies(ekf_rio_gencpp ekf_rio_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ekf_rio_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ekf_rio
  "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioCovariance.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ekf_rio
)
_generate_msg_eus(ekf_rio
  "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ekf_rio
)

### Generating Services

### Generating Module File
_generate_module_eus(ekf_rio
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ekf_rio
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ekf_rio_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ekf_rio_generate_messages ekf_rio_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioCovariance.msg" NAME_WE)
add_dependencies(ekf_rio_generate_messages_eus _ekf_rio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioState.msg" NAME_WE)
add_dependencies(ekf_rio_generate_messages_eus _ekf_rio_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ekf_rio_geneus)
add_dependencies(ekf_rio_geneus ekf_rio_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ekf_rio_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ekf_rio
  "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioCovariance.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ekf_rio
)
_generate_msg_lisp(ekf_rio
  "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ekf_rio
)

### Generating Services

### Generating Module File
_generate_module_lisp(ekf_rio
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ekf_rio
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ekf_rio_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ekf_rio_generate_messages ekf_rio_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioCovariance.msg" NAME_WE)
add_dependencies(ekf_rio_generate_messages_lisp _ekf_rio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioState.msg" NAME_WE)
add_dependencies(ekf_rio_generate_messages_lisp _ekf_rio_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ekf_rio_genlisp)
add_dependencies(ekf_rio_genlisp ekf_rio_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ekf_rio_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ekf_rio
  "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioCovariance.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ekf_rio
)
_generate_msg_nodejs(ekf_rio
  "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ekf_rio
)

### Generating Services

### Generating Module File
_generate_module_nodejs(ekf_rio
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ekf_rio
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ekf_rio_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ekf_rio_generate_messages ekf_rio_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioCovariance.msg" NAME_WE)
add_dependencies(ekf_rio_generate_messages_nodejs _ekf_rio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioState.msg" NAME_WE)
add_dependencies(ekf_rio_generate_messages_nodejs _ekf_rio_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ekf_rio_gennodejs)
add_dependencies(ekf_rio_gennodejs ekf_rio_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ekf_rio_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ekf_rio
  "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioCovariance.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ekf_rio
)
_generate_msg_py(ekf_rio
  "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ekf_rio
)

### Generating Services

### Generating Module File
_generate_module_py(ekf_rio
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ekf_rio
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ekf_rio_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ekf_rio_generate_messages ekf_rio_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioCovariance.msg" NAME_WE)
add_dependencies(ekf_rio_generate_messages_py _ekf_rio_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ypandos/work/rostest/src/ekf_rio/msg/EkfRioState.msg" NAME_WE)
add_dependencies(ekf_rio_generate_messages_py _ekf_rio_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ekf_rio_genpy)
add_dependencies(ekf_rio_genpy ekf_rio_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ekf_rio_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ekf_rio)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ekf_rio
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ekf_rio_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(ekf_rio_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(ekf_rio_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET roscpp_generate_messages_cpp)
  add_dependencies(ekf_rio_generate_messages_cpp roscpp_generate_messages_cpp)
endif()
if(TARGET dynamic_reconfigure_generate_messages_cpp)
  add_dependencies(ekf_rio_generate_messages_cpp dynamic_reconfigure_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ekf_rio)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ekf_rio
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ekf_rio_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(ekf_rio_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(ekf_rio_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET roscpp_generate_messages_eus)
  add_dependencies(ekf_rio_generate_messages_eus roscpp_generate_messages_eus)
endif()
if(TARGET dynamic_reconfigure_generate_messages_eus)
  add_dependencies(ekf_rio_generate_messages_eus dynamic_reconfigure_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ekf_rio)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ekf_rio
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ekf_rio_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(ekf_rio_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(ekf_rio_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET roscpp_generate_messages_lisp)
  add_dependencies(ekf_rio_generate_messages_lisp roscpp_generate_messages_lisp)
endif()
if(TARGET dynamic_reconfigure_generate_messages_lisp)
  add_dependencies(ekf_rio_generate_messages_lisp dynamic_reconfigure_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ekf_rio)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ekf_rio
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ekf_rio_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(ekf_rio_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(ekf_rio_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET roscpp_generate_messages_nodejs)
  add_dependencies(ekf_rio_generate_messages_nodejs roscpp_generate_messages_nodejs)
endif()
if(TARGET dynamic_reconfigure_generate_messages_nodejs)
  add_dependencies(ekf_rio_generate_messages_nodejs dynamic_reconfigure_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ekf_rio)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ekf_rio\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ekf_rio
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ekf_rio_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(ekf_rio_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(ekf_rio_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET roscpp_generate_messages_py)
  add_dependencies(ekf_rio_generate_messages_py roscpp_generate_messages_py)
endif()
if(TARGET dynamic_reconfigure_generate_messages_py)
  add_dependencies(ekf_rio_generate_messages_py dynamic_reconfigure_generate_messages_py)
endif()
