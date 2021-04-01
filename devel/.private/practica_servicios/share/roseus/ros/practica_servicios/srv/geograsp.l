;; Auto-generated. Do not edit!


(when (boundp 'practica_servicios::geograsp)
  (if (not (find-package "PRACTICA_SERVICIOS"))
    (make-package "PRACTICA_SERVICIOS"))
  (shadow 'geograsp (find-package "PRACTICA_SERVICIOS")))
(unless (find-package "PRACTICA_SERVICIOS::GEOGRASP")
  (make-package "PRACTICA_SERVICIOS::GEOGRASP"))
(unless (find-package "PRACTICA_SERVICIOS::GEOGRASPREQUEST")
  (make-package "PRACTICA_SERVICIOS::GEOGRASPREQUEST"))
(unless (find-package "PRACTICA_SERVICIOS::GEOGRASPRESPONSE")
  (make-package "PRACTICA_SERVICIOS::GEOGRASPRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass practica_servicios::geograspRequest
  :super ros::object
  :slots ())

(defmethod practica_servicios::geograspRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass practica_servicios::geograspResponse
  :super ros::object
  :slots (_p ))

(defmethod practica_servicios::geograspResponse
  (:init
   (&key
    ((:p __p) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _p __p)
   self)
  (:p
   (&rest __p)
   (if (keywordp (car __p))
       (send* _p __p)
     (progn
       (if __p (setq _p (car __p)))
       _p)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _p
    (send _p :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _p
       (send _p :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _p
     (send _p :deserialize buf ptr-) (incf ptr- (send _p :serialization-length))
   ;;
   self)
  )

(defclass practica_servicios::geograsp
  :super ros::object
  :slots ())

(setf (get practica_servicios::geograsp :md5sum-) "f99e2553a5b4745dfc6f3efd371b9886")
(setf (get practica_servicios::geograsp :datatype-) "practica_servicios/geograsp")
(setf (get practica_servicios::geograsp :request) practica_servicios::geograspRequest)
(setf (get practica_servicios::geograsp :response) practica_servicios::geograspResponse)

(defmethod practica_servicios::geograspRequest
  (:response () (instance practica_servicios::geograspResponse :init)))

(setf (get practica_servicios::geograspRequest :md5sum-) "f99e2553a5b4745dfc6f3efd371b9886")
(setf (get practica_servicios::geograspRequest :datatype-) "practica_servicios/geograspRequest")
(setf (get practica_servicios::geograspRequest :definition-)
      "---
geometry_msgs/Pose p

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

(setf (get practica_servicios::geograspResponse :md5sum-) "f99e2553a5b4745dfc6f3efd371b9886")
(setf (get practica_servicios::geograspResponse :datatype-) "practica_servicios/geograspResponse")
(setf (get practica_servicios::geograspResponse :definition-)
      "---
geometry_msgs/Pose p

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



(provide :practica_servicios/geograsp "f99e2553a5b4745dfc6f3efd371b9886")


