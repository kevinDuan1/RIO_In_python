;; Auto-generated. Do not edit!


(when (boundp 'ekf_rio::EkfRioState)
  (if (not (find-package "EKF_RIO"))
    (make-package "EKF_RIO"))
  (shadow 'EkfRioState (find-package "EKF_RIO")))
(unless (find-package "EKF_RIO::EKFRIOSTATE")
  (make-package "EKF_RIO::EKFRIOSTATE"))

(in-package "ROS")
;;//! \htmlinclude EkfRioState.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ekf_rio::EkfRioState
  :super ros::object
  :slots (_header _p _v _q _eul_deg _b_a _b_g_deg _b_alt _l_b_r _q_b_r _eul_b_r_deg ))

(defmethod ekf_rio::EkfRioState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:p __p) (instance geometry_msgs::Vector3 :init))
    ((:v __v) (instance geometry_msgs::Vector3 :init))
    ((:q __q) (instance geometry_msgs::Quaternion :init))
    ((:eul_deg __eul_deg) (instance geometry_msgs::Vector3 :init))
    ((:b_a __b_a) (instance geometry_msgs::Vector3 :init))
    ((:b_g_deg __b_g_deg) (instance geometry_msgs::Vector3 :init))
    ((:b_alt __b_alt) 0.0)
    ((:l_b_r __l_b_r) (instance geometry_msgs::Vector3 :init))
    ((:q_b_r __q_b_r) (instance geometry_msgs::Quaternion :init))
    ((:eul_b_r_deg __eul_b_r_deg) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _p __p)
   (setq _v __v)
   (setq _q __q)
   (setq _eul_deg __eul_deg)
   (setq _b_a __b_a)
   (setq _b_g_deg __b_g_deg)
   (setq _b_alt (float __b_alt))
   (setq _l_b_r __l_b_r)
   (setq _q_b_r __q_b_r)
   (setq _eul_b_r_deg __eul_b_r_deg)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:p
   (&rest __p)
   (if (keywordp (car __p))
       (send* _p __p)
     (progn
       (if __p (setq _p (car __p)))
       _p)))
  (:v
   (&rest __v)
   (if (keywordp (car __v))
       (send* _v __v)
     (progn
       (if __v (setq _v (car __v)))
       _v)))
  (:q
   (&rest __q)
   (if (keywordp (car __q))
       (send* _q __q)
     (progn
       (if __q (setq _q (car __q)))
       _q)))
  (:eul_deg
   (&rest __eul_deg)
   (if (keywordp (car __eul_deg))
       (send* _eul_deg __eul_deg)
     (progn
       (if __eul_deg (setq _eul_deg (car __eul_deg)))
       _eul_deg)))
  (:b_a
   (&rest __b_a)
   (if (keywordp (car __b_a))
       (send* _b_a __b_a)
     (progn
       (if __b_a (setq _b_a (car __b_a)))
       _b_a)))
  (:b_g_deg
   (&rest __b_g_deg)
   (if (keywordp (car __b_g_deg))
       (send* _b_g_deg __b_g_deg)
     (progn
       (if __b_g_deg (setq _b_g_deg (car __b_g_deg)))
       _b_g_deg)))
  (:b_alt
   (&optional __b_alt)
   (if __b_alt (setq _b_alt __b_alt)) _b_alt)
  (:l_b_r
   (&rest __l_b_r)
   (if (keywordp (car __l_b_r))
       (send* _l_b_r __l_b_r)
     (progn
       (if __l_b_r (setq _l_b_r (car __l_b_r)))
       _l_b_r)))
  (:q_b_r
   (&rest __q_b_r)
   (if (keywordp (car __q_b_r))
       (send* _q_b_r __q_b_r)
     (progn
       (if __q_b_r (setq _q_b_r (car __q_b_r)))
       _q_b_r)))
  (:eul_b_r_deg
   (&rest __eul_b_r_deg)
   (if (keywordp (car __eul_b_r_deg))
       (send* _eul_b_r_deg __eul_b_r_deg)
     (progn
       (if __eul_b_r_deg (setq _eul_b_r_deg (car __eul_b_r_deg)))
       _eul_b_r_deg)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Vector3 _p
    (send _p :serialization-length)
    ;; geometry_msgs/Vector3 _v
    (send _v :serialization-length)
    ;; geometry_msgs/Quaternion _q
    (send _q :serialization-length)
    ;; geometry_msgs/Vector3 _eul_deg
    (send _eul_deg :serialization-length)
    ;; geometry_msgs/Vector3 _b_a
    (send _b_a :serialization-length)
    ;; geometry_msgs/Vector3 _b_g_deg
    (send _b_g_deg :serialization-length)
    ;; float32 _b_alt
    4
    ;; geometry_msgs/Vector3 _l_b_r
    (send _l_b_r :serialization-length)
    ;; geometry_msgs/Quaternion _q_b_r
    (send _q_b_r :serialization-length)
    ;; geometry_msgs/Vector3 _eul_b_r_deg
    (send _eul_b_r_deg :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Vector3 _p
       (send _p :serialize s)
     ;; geometry_msgs/Vector3 _v
       (send _v :serialize s)
     ;; geometry_msgs/Quaternion _q
       (send _q :serialize s)
     ;; geometry_msgs/Vector3 _eul_deg
       (send _eul_deg :serialize s)
     ;; geometry_msgs/Vector3 _b_a
       (send _b_a :serialize s)
     ;; geometry_msgs/Vector3 _b_g_deg
       (send _b_g_deg :serialize s)
     ;; float32 _b_alt
       (sys::poke _b_alt (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/Vector3 _l_b_r
       (send _l_b_r :serialize s)
     ;; geometry_msgs/Quaternion _q_b_r
       (send _q_b_r :serialize s)
     ;; geometry_msgs/Vector3 _eul_b_r_deg
       (send _eul_b_r_deg :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Vector3 _p
     (send _p :deserialize buf ptr-) (incf ptr- (send _p :serialization-length))
   ;; geometry_msgs/Vector3 _v
     (send _v :deserialize buf ptr-) (incf ptr- (send _v :serialization-length))
   ;; geometry_msgs/Quaternion _q
     (send _q :deserialize buf ptr-) (incf ptr- (send _q :serialization-length))
   ;; geometry_msgs/Vector3 _eul_deg
     (send _eul_deg :deserialize buf ptr-) (incf ptr- (send _eul_deg :serialization-length))
   ;; geometry_msgs/Vector3 _b_a
     (send _b_a :deserialize buf ptr-) (incf ptr- (send _b_a :serialization-length))
   ;; geometry_msgs/Vector3 _b_g_deg
     (send _b_g_deg :deserialize buf ptr-) (incf ptr- (send _b_g_deg :serialization-length))
   ;; float32 _b_alt
     (setq _b_alt (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/Vector3 _l_b_r
     (send _l_b_r :deserialize buf ptr-) (incf ptr- (send _l_b_r :serialization-length))
   ;; geometry_msgs/Quaternion _q_b_r
     (send _q_b_r :deserialize buf ptr-) (incf ptr- (send _q_b_r :serialization-length))
   ;; geometry_msgs/Vector3 _eul_b_r_deg
     (send _eul_b_r_deg :deserialize buf ptr-) (incf ptr- (send _eul_b_r_deg :serialization-length))
   ;;
   self)
  )

(setf (get ekf_rio::EkfRioState :md5sum-) "6c5323fa7187f2894466fea406ae0fd2")
(setf (get ekf_rio::EkfRioState :datatype-) "ekf_rio/EkfRioState")
(setf (get ekf_rio::EkfRioState :definition-)
      "Header header

geometry_msgs/Vector3 p
geometry_msgs/Vector3 v
geometry_msgs/Quaternion q
geometry_msgs/Vector3 eul_deg
geometry_msgs/Vector3 b_a
geometry_msgs/Vector3 b_g_deg
float32 b_alt
geometry_msgs/Vector3 l_b_r
geometry_msgs/Quaternion q_b_r
geometry_msgs/Vector3 eul_b_r_deg


================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :ekf_rio/EkfRioState "6c5323fa7187f2894466fea406ae0fd2")


