;; Auto-generated. Do not edit!


(when (boundp 'hoofdprogramma::KwastDetection)
  (if (not (find-package "HOOFDPROGRAMMA"))
    (make-package "HOOFDPROGRAMMA"))
  (shadow 'KwastDetection (find-package "HOOFDPROGRAMMA")))
(unless (find-package "HOOFDPROGRAMMA::KWASTDETECTION")
  (make-package "HOOFDPROGRAMMA::KWASTDETECTION"))

(in-package "ROS")
;;//! \htmlinclude KwastDetection.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass hoofdprogramma::KwastDetection
  :super ros::object
  :slots (_pose _kwast_type ))

(defmethod hoofdprogramma::KwastDetection
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:kwast_type __kwast_type) "")
    )
   (send-super :init)
   (setq _pose __pose)
   (setq _kwast_type (string __kwast_type))
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:kwast_type
   (&optional __kwast_type)
   (if __kwast_type (setq _kwast_type __kwast_type)) _kwast_type)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; string _kwast_type
    4 (length _kwast_type)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; string _kwast_type
       (write-long (length _kwast_type) s) (princ _kwast_type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; string _kwast_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _kwast_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get hoofdprogramma::KwastDetection :md5sum-) "c8790f86ce3eccb0d6b3eb32c5c4a515")
(setf (get hoofdprogramma::KwastDetection :datatype-) "hoofdprogramma/KwastDetection")
(setf (get hoofdprogramma::KwastDetection :definition-)
      "geometry_msgs/Pose pose
string kwast_type

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
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



(provide :hoofdprogramma/KwastDetection "c8790f86ce3eccb0d6b3eb32c5c4a515")


