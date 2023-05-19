; Auto-generated. Do not edit!


(cl:in-package ekf_rio-msg)


;//! \htmlinclude EkfRioCovariance.msg.html

(cl:defclass <EkfRioCovariance> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (sigma_p
    :reader sigma_p
    :initarg :sigma_p
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (sigma_v
    :reader sigma_v
    :initarg :sigma_v
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (sigma_eul_deg
    :reader sigma_eul_deg
    :initarg :sigma_eul_deg
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (sigma_b_a
    :reader sigma_b_a
    :initarg :sigma_b_a
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (sigma_b_g_deg
    :reader sigma_b_g_deg
    :initarg :sigma_b_g_deg
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (sigma_alt
    :reader sigma_alt
    :initarg :sigma_alt
    :type cl:float
    :initform 0.0)
   (sigma_l_b_r
    :reader sigma_l_b_r
    :initarg :sigma_l_b_r
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (sigma_eul_b_r_deg
    :reader sigma_eul_b_r_deg
    :initarg :sigma_eul_b_r_deg
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass EkfRioCovariance (<EkfRioCovariance>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EkfRioCovariance>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EkfRioCovariance)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ekf_rio-msg:<EkfRioCovariance> is deprecated: use ekf_rio-msg:EkfRioCovariance instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EkfRioCovariance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:header-val is deprecated.  Use ekf_rio-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sigma_p-val :lambda-list '(m))
(cl:defmethod sigma_p-val ((m <EkfRioCovariance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:sigma_p-val is deprecated.  Use ekf_rio-msg:sigma_p instead.")
  (sigma_p m))

(cl:ensure-generic-function 'sigma_v-val :lambda-list '(m))
(cl:defmethod sigma_v-val ((m <EkfRioCovariance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:sigma_v-val is deprecated.  Use ekf_rio-msg:sigma_v instead.")
  (sigma_v m))

(cl:ensure-generic-function 'sigma_eul_deg-val :lambda-list '(m))
(cl:defmethod sigma_eul_deg-val ((m <EkfRioCovariance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:sigma_eul_deg-val is deprecated.  Use ekf_rio-msg:sigma_eul_deg instead.")
  (sigma_eul_deg m))

(cl:ensure-generic-function 'sigma_b_a-val :lambda-list '(m))
(cl:defmethod sigma_b_a-val ((m <EkfRioCovariance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:sigma_b_a-val is deprecated.  Use ekf_rio-msg:sigma_b_a instead.")
  (sigma_b_a m))

(cl:ensure-generic-function 'sigma_b_g_deg-val :lambda-list '(m))
(cl:defmethod sigma_b_g_deg-val ((m <EkfRioCovariance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:sigma_b_g_deg-val is deprecated.  Use ekf_rio-msg:sigma_b_g_deg instead.")
  (sigma_b_g_deg m))

(cl:ensure-generic-function 'sigma_alt-val :lambda-list '(m))
(cl:defmethod sigma_alt-val ((m <EkfRioCovariance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:sigma_alt-val is deprecated.  Use ekf_rio-msg:sigma_alt instead.")
  (sigma_alt m))

(cl:ensure-generic-function 'sigma_l_b_r-val :lambda-list '(m))
(cl:defmethod sigma_l_b_r-val ((m <EkfRioCovariance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:sigma_l_b_r-val is deprecated.  Use ekf_rio-msg:sigma_l_b_r instead.")
  (sigma_l_b_r m))

(cl:ensure-generic-function 'sigma_eul_b_r_deg-val :lambda-list '(m))
(cl:defmethod sigma_eul_b_r_deg-val ((m <EkfRioCovariance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:sigma_eul_b_r_deg-val is deprecated.  Use ekf_rio-msg:sigma_eul_b_r_deg instead.")
  (sigma_eul_b_r_deg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EkfRioCovariance>) ostream)
  "Serializes a message object of type '<EkfRioCovariance>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sigma_p) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sigma_v) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sigma_eul_deg) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sigma_b_a) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sigma_b_g_deg) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sigma_alt))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sigma_l_b_r) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sigma_eul_b_r_deg) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EkfRioCovariance>) istream)
  "Deserializes a message object of type '<EkfRioCovariance>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sigma_p) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sigma_v) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sigma_eul_deg) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sigma_b_a) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sigma_b_g_deg) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sigma_alt) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sigma_l_b_r) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sigma_eul_b_r_deg) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EkfRioCovariance>)))
  "Returns string type for a message object of type '<EkfRioCovariance>"
  "ekf_rio/EkfRioCovariance")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EkfRioCovariance)))
  "Returns string type for a message object of type 'EkfRioCovariance"
  "ekf_rio/EkfRioCovariance")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EkfRioCovariance>)))
  "Returns md5sum for a message object of type '<EkfRioCovariance>"
  "fd1c27053c1dd5f05552831fb830514c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EkfRioCovariance)))
  "Returns md5sum for a message object of type 'EkfRioCovariance"
  "fd1c27053c1dd5f05552831fb830514c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EkfRioCovariance>)))
  "Returns full string definition for message of type '<EkfRioCovariance>"
  (cl:format cl:nil "Header header~%~%geometry_msgs/Vector3 sigma_p~%geometry_msgs/Vector3 sigma_v~%geometry_msgs/Vector3 sigma_eul_deg~%geometry_msgs/Vector3 sigma_b_a~%geometry_msgs/Vector3 sigma_b_g_deg~%float32 sigma_alt~%geometry_msgs/Vector3 sigma_l_b_r~%geometry_msgs/Vector3 sigma_eul_b_r_deg~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EkfRioCovariance)))
  "Returns full string definition for message of type 'EkfRioCovariance"
  (cl:format cl:nil "Header header~%~%geometry_msgs/Vector3 sigma_p~%geometry_msgs/Vector3 sigma_v~%geometry_msgs/Vector3 sigma_eul_deg~%geometry_msgs/Vector3 sigma_b_a~%geometry_msgs/Vector3 sigma_b_g_deg~%float32 sigma_alt~%geometry_msgs/Vector3 sigma_l_b_r~%geometry_msgs/Vector3 sigma_eul_b_r_deg~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EkfRioCovariance>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sigma_p))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sigma_v))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sigma_eul_deg))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sigma_b_a))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sigma_b_g_deg))
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sigma_l_b_r))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sigma_eul_b_r_deg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EkfRioCovariance>))
  "Converts a ROS message object to a list"
  (cl:list 'EkfRioCovariance
    (cl:cons ':header (header msg))
    (cl:cons ':sigma_p (sigma_p msg))
    (cl:cons ':sigma_v (sigma_v msg))
    (cl:cons ':sigma_eul_deg (sigma_eul_deg msg))
    (cl:cons ':sigma_b_a (sigma_b_a msg))
    (cl:cons ':sigma_b_g_deg (sigma_b_g_deg msg))
    (cl:cons ':sigma_alt (sigma_alt msg))
    (cl:cons ':sigma_l_b_r (sigma_l_b_r msg))
    (cl:cons ':sigma_eul_b_r_deg (sigma_eul_b_r_deg msg))
))
