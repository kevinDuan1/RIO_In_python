;; Auto-generated. Do not edit!


(when (boundp 'ekf_rio::EkfRioCovariance)
  (if (not (find-package "EKF_RIO"))
    (make-package "EKF_RIO"))
  (shadow 'EkfRioCovariance (find-package "EKF_RIO")))
(unless (find-package "EKF_RIO::EKFRIOCOVARIANCE")
  (make-package "EKF_RIO::EKFRIOCOVARIANCE"))

(in-package "ROS")
;;//! \htmlinclude EkfRioCovariance.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ekf_rio::EkfRioCovariance
  :super ros::object
  :slots (_header _sigma_p _sigma_v _sigma_eul_deg _sigma_b_a _sigma_b_g_deg _sigma_alt _sigma_l_b_r _sigma_eul_b_r_deg ))

(defmethod ekf_rio::EkfRioCovariance
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:sigma_p __sigma_p) (instance geometry_msgs::Vector3 :init))
    ((:sigma_v __sigma_v) (instance geometry_msgs::Vector3 :init))
    ((:sigma_eul_deg __sigma_eul_deg) (instance geometry_msgs::Vector3 :init))
    ((:sigma_b_a __sigma_b_a) (instance geometry_msgs::Vector3 :init))
    ((:sigma_b_g_deg __sigma_b_g_deg) (instance geometry_msgs::Vector3 :init))
    ((:sigma_alt __sigma_alt) 0.0)
    ((:sigma_l_b_r __sigma_l_b_r) (instance geometry_msgs::Vector3 :init))
    ((:sigma_eul_b_r_deg __sigma_eul_b_r_deg) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _sigma_p __sigma_p)
   (setq _sigma_v __sigma_v)
   (setq _sigma_eul_deg __sigma_eul_deg)
   (setq _sigma_b_a __sigma_b_a)
   (setq _sigma_b_g_deg __sigma_b_g_deg)
   (setq _sigma_alt (float __sigma_alt))
   (setq _sigma_l_b_r __sigma_l_b_r)
   (setq _sigma_eul_b_r_deg __sigma_eul_b_r_deg)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:sigma_p
   (&rest __sigma_p)
   (if (keywordp (car __sigma_p))
       (send* _sigma_p __sigma_p)
     (progn
       (if __sigma_p (setq _sigma_p (car __sigma_p)))
       _sigma_p)))
  (:sigma_v
   (&rest __sigma_v)
   (if (keywordp (car __sigma_v))
       (send* _sigma_v __sigma_v)
     (progn
       (if __sigma_v (setq _sigma_v (car __sigma_v)))
       _sigma_v)))
  (:sigma_eul_deg
   (&rest __sigma_eul_deg)
   (if (keywordp (car __sigma_eul_deg))
       (send* _sigma_eul_deg __sigma_eul_deg)
     (progn
       (if __sigma_eul_deg (setq _sigma_eul_deg (car __sigma_eul_deg)))
       _sigma_eul_deg)))
  (:sigma_b_a
   (&rest __sigma_b_a)
   (if (keywordp (car __sigma_b_a))
       (send* _sigma_b_a __sigma_b_a)
     (progn
       (if __sigma_b_a (setq _sigma_b_a (car __sigma_b_a)))
       _sigma_b_a)))
  (:sigma_b_g_deg
   (&rest __sigma_b_g_deg)
   (if (keywordp (car __sigma_b_g_deg))
       (send* _sigma_b_g_deg __sigma_b_g_deg)
     (progn
       (if __sigma_b_g_deg (setq _sigma_b_g_deg (car __sigma_b_g_deg)))
       _sigma_b_g_deg)))
  (:sigma_alt
   (&optional __sigma_alt)
   (if __sigma_alt (setq _sigma_alt __sigma_alt)) _sigma_alt)
  (:sigma_l_b_r
   (&rest __sigma_l_b_r)
   (if (keywordp (car __sigma_l_b_r))
       (send* _sigma_l_b_r __sigma_l_b_r)
     (progn
       (if __sigma_l_b_r (setq _sigma_l_b_r (car __sigma_l_b_r)))
       _sigma_l_b_r)))
  (:sigma_eul_b_r_deg
   (&rest __sigma_eul_b_r_deg)
   (if (keywordp (car __sigma_eul_b_r_deg))
       (send* _sigma_eul_b_r_deg __sigma_eul_b_r_deg)
     (progn
       (if __sigma_eul_b_r_deg (setq _sigma_eul_b_r_deg (car __sigma_eul_b_r_deg)))
       _sigma_eul_b_r_deg)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Vector3 _sigma_p
    (send _sigma_p :serialization-length)
    ;; geometry_msgs/Vector3 _sigma_v
    (send _sigma_v :serialization-length)
    ;; geometry_msgs/Vector3 _sigma_eul_deg
    (send _sigma_eul_deg :serialization-length)
    ;; geometry_msgs/Vector3 _sigma_b_a
    (send _sigma_b_a :serialization-length)
    ;; geometry_msgs/Vector3 _sigma_b_g_deg
    (send _sigma_b_g_deg :serialization-length)
    ;; float32 _sigma_alt
    4
    ;; geometry_msgs/Vector3 _sigma_l_b_r
    (send _sigma_l_b_r :serialization-length)
    ;; geometry_msgs/Vector3 _sigma_eul_b_r_deg
    (send _sigma_eul_b_r_deg :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Vector3 _sigma_p
       (send _sigma_p :serialize s)
     ;; geometry_msgs/Vector3 _sigma_v
       (send _sigma_v :serialize s)
     ;; geometry_msgs/Vector3 _sigma_eul_deg
       (send _sigma_eul_deg :serialize s)
     ;; geometry_msgs/Vector3 _sigma_b_a
       (send _sigma_b_a :serialize s)
     ;; geometry_msgs/Vector3 _sigma_b_g_deg
       (send _sigma_b_g_deg :serialize s)
     ;; float32 _sigma_alt
       (sys::poke _sigma_alt (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/Vector3 _sigma_l_b_r
       (send _sigma_l_b_r :serialize s)
     ;; geometry_msgs/Vector3 _sigma_eul_b_r_deg
       (send _sigma_eul_b_r_deg :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Vector3 _sigma_p
     (send _sigma_p :deserialize buf ptr-) (incf ptr- (send _sigma_p :serialization-length))
   ;; geometry_msgs/Vector3 _sigma_v
     (send _sigma_v :deserialize buf ptr-) (incf ptr- (send _sigma_v :serialization-length))
   ;; geometry_msgs/Vector3 _sigma_eul_deg
     (send _sigma_eul_deg :deserialize buf ptr-) (incf ptr- (send _sigma_eul_deg :serialization-length))
   ;; geometry_msgs/Vector3 _sigma_b_a
     (send _sigma_b_a :deserialize buf ptr-) (incf ptr- (send _sigma_b_a :serialization-length))
   ;; geometry_msgs/Vector3 _sigma_b_g_deg
     (send _sigma_b_g_deg :deserialize buf ptr-) (incf ptr- (send _sigma_b_g_deg :serialization-length))
   ;; float32 _sigma_alt
     (setq _sigma_alt (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/Vector3 _sigma_l_b_r
     (send _sigma_l_b_r :deserialize buf ptr-) (incf ptr- (send _sigma_l_b_r :serialization-length))
   ;; geometry_msgs/Vector3 _sigma_eul_b_r_deg
     (send _sigma_eul_b_r_deg :deserialize buf ptr-) (incf ptr- (send _sigma_eul_b_r_deg :serialization-length))
   ;;
   self)
  )

(setf (get ekf_rio::EkfRioCovariance :md5sum-) "fd1c27053c1dd5f05552831fb830514c")
(setf (get ekf_rio::EkfRioCovariance :datatype-) "ekf_rio/EkfRioCovariance")
(setf (get ekf_rio::EkfRioCovariance :definition-)
      "Header header

geometry_msgs/Vector3 sigma_p
geometry_msgs/Vector3 sigma_v
geometry_msgs/Vector3 sigma_eul_deg
geometry_msgs/Vector3 sigma_b_a
geometry_msgs/Vector3 sigma_b_g_deg
float32 sigma_alt
geometry_msgs/Vector3 sigma_l_b_r
geometry_msgs/Vector3 sigma_eul_b_r_deg

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
")



(provide :ekf_rio/EkfRioCovariance "fd1c27053c1dd5f05552831fb830514c")


