
(cl:in-package :asdf)

(defsystem "ekf_rio-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "EkfRioCovariance" :depends-on ("_package_EkfRioCovariance"))
    (:file "_package_EkfRioCovariance" :depends-on ("_package"))
    (:file "EkfRioState" :depends-on ("_package_EkfRioState"))
    (:file "_package_EkfRioState" :depends-on ("_package"))
  ))