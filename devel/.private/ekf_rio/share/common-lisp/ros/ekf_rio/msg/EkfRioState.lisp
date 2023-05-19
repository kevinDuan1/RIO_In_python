; Auto-generated. Do not edit!


(cl:in-package ekf_rio-msg)


;//! \htmlinclude EkfRioState.msg.html

(cl:defclass <EkfRioState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (p
    :reader p
    :initarg :p
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (v
    :reader v
    :initarg :v
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (q
    :reader q
    :initarg :q
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion))
   (eul_deg
    :reader eul_deg
    :initarg :eul_deg
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (b_a
    :reader b_a
    :initarg :b_a
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (b_g_deg
    :reader b_g_deg
    :initarg :b_g_deg
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (b_alt
    :reader b_alt
    :initarg :b_alt
    :type cl:float
    :initform 0.0)
   (l_b_r
    :reader l_b_r
    :initarg :l_b_r
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (q_b_r
    :reader q_b_r
    :initarg :q_b_r
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion))
   (eul_b_r_deg
    :reader eul_b_r_deg
    :initarg :eul_b_r_deg
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass EkfRioState (<EkfRioState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EkfRioState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EkfRioState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ekf_rio-msg:<EkfRioState> is deprecated: use ekf_rio-msg:EkfRioState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EkfRioState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:header-val is deprecated.  Use ekf_rio-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'p-val :lambda-list '(m))
(cl:defmethod p-val ((m <EkfRioState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:p-val is deprecated.  Use ekf_rio-msg:p instead.")
  (p m))

(cl:ensure-generic-function 'v-val :lambda-list '(m))
(cl:defmethod v-val ((m <EkfRioState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:v-val is deprecated.  Use ekf_rio-msg:v instead.")
  (v m))

(cl:ensure-generic-function 'q-val :lambda-list '(m))
(cl:defmethod q-val ((m <EkfRioState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:q-val is deprecated.  Use ekf_rio-msg:q instead.")
  (q m))

(cl:ensure-generic-function 'eul_deg-val :lambda-list '(m))
(cl:defmethod eul_deg-val ((m <EkfRioState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:eul_deg-val is deprecated.  Use ekf_rio-msg:eul_deg instead.")
  (eul_deg m))

(cl:ensure-generic-function 'b_a-val :lambda-list '(m))
(cl:defmethod b_a-val ((m <EkfRioState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:b_a-val is deprecated.  Use ekf_rio-msg:b_a instead.")
  (b_a m))

(cl:ensure-generic-function 'b_g_deg-val :lambda-list '(m))
(cl:defmethod b_g_deg-val ((m <EkfRioState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:b_g_deg-val is deprecated.  Use ekf_rio-msg:b_g_deg instead.")
  (b_g_deg m))

(cl:ensure-generic-function 'b_alt-val :lambda-list '(m))
(cl:defmethod b_alt-val ((m <EkfRioState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:b_alt-val is deprecated.  Use ekf_rio-msg:b_alt instead.")
  (b_alt m))

(cl:ensure-generic-function 'l_b_r-val :lambda-list '(m))
(cl:defmethod l_b_r-val ((m <EkfRioState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:l_b_r-val is deprecated.  Use ekf_rio-msg:l_b_r instead.")
  (l_b_r m))

(cl:ensure-generic-function 'q_b_r-val :lambda-list '(m))
(cl:defmethod q_b_r-val ((m <EkfRioState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:q_b_r-val is deprecated.  Use ekf_rio-msg:q_b_r instead.")
  (q_b_r m))

(cl:ensure-generic-function 'eul_b_r_deg-val :lambda-list '(m))
(cl:defmethod eul_b_r_deg-val ((m <EkfRioState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekf_rio-msg:eul_b_r_deg-val is deprecated.  Use ekf_rio-msg:eul_b_r_deg instead.")
  (eul_b_r_deg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EkfRioState>) ostream)
  "Serializes a message object of type '<EkfRioState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'p) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'v) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'q) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'eul_deg) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'b_a) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'b_g_deg) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'b_alt))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'l_b_r) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'q_b_r) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'eul_b_r_deg) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EkfRioState>) istream)
  "Deserializes a message object of type '<EkfRioState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'p) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'v) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'q) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'eul_deg) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'b_a) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'b_g_deg) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'b_alt) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'l_b_r) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'q_b_r) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'eul_b_r_deg) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EkfRioState>)))
  "Returns string type for a message object of type '<EkfRioState>"
  "ekf_rio/EkfRioState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EkfRioState)))
  "Returns string type for a message object of type 'EkfRioState"
  "ekf_rio/EkfRioState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EkfRioState>)))
  "Returns md5sum for a message object of type '<EkfRioState>"
  "6c5323fa7187f2894466fea406ae0fd2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EkfRioState)))
  "Returns md5sum for a message object of type 'EkfRioState"
  "6c5323fa7187f2894466fea406ae0fd2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EkfRioState>)))
  "Returns full string definition for message of type '<EkfRioState>"
  (cl:format cl:nil "Header header~%~%geometry_msgs/Vector3 p~%geometry_msgs/Vector3 v~%geometry_msgs/Quaternion q~%geometry_msgs/Vector3 eul_deg~%geometry_msgs/Vector3 b_a~%geometry_msgs/Vector3 b_g_deg~%float32 b_alt~%geometry_msgs/Vector3 l_b_r~%geometry_msgs/Quaternion q_b_r~%geometry_msgs/Vector3 eul_b_r_deg~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EkfRioState)))
  "Returns full string definition for message of type 'EkfRioState"
  (cl:format cl:nil "Header header~%~%geometry_msgs/Vector3 p~%geometry_msgs/Vector3 v~%geometry_msgs/Quaternion q~%geometry_msgs/Vector3 eul_deg~%geometry_msgs/Vector3 b_a~%geometry_msgs/Vector3 b_g_deg~%float32 b_alt~%geometry_msgs/Vector3 l_b_r~%geometry_msgs/Quaternion q_b_r~%geometry_msgs/Vector3 eul_b_r_deg~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EkfRioState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'p))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'v))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'q))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'eul_deg))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'b_a))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'b_g_deg))
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'l_b_r))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'q_b_r))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'eul_b_r_deg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EkfRioState>))
  "Converts a ROS message object to a list"
  (cl:list 'EkfRioState
    (cl:cons ':header (header msg))
    (cl:cons ':p (p msg))
    (cl:cons ':v (v msg))
    (cl:cons ':q (q msg))
    (cl:cons ':eul_deg (eul_deg msg))
    (cl:cons ':b_a (b_a msg))
    (cl:cons ':b_g_deg (b_g_deg msg))
    (cl:cons ':b_alt (b_alt msg))
    (cl:cons ':l_b_r (l_b_r msg))
    (cl:cons ':q_b_r (q_b_r msg))
    (cl:cons ':eul_b_r_deg (eul_b_r_deg msg))
))
