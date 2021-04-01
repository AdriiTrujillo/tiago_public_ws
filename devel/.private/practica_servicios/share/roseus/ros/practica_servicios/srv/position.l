;; Auto-generated. Do not edit!


(when (boundp 'practica_servicios::position)
  (if (not (find-package "PRACTICA_SERVICIOS"))
    (make-package "PRACTICA_SERVICIOS"))
  (shadow 'position (find-package "PRACTICA_SERVICIOS")))
(unless (find-package "PRACTICA_SERVICIOS::POSITION")
  (make-package "PRACTICA_SERVICIOS::POSITION"))
(unless (find-package "PRACTICA_SERVICIOS::POSITIONREQUEST")
  (make-package "PRACTICA_SERVICIOS::POSITIONREQUEST"))
(unless (find-package "PRACTICA_SERVICIOS::POSITIONRESPONSE")
  (make-package "PRACTICA_SERVICIOS::POSITIONRESPONSE"))

(in-package "ROS")





(defclass practica_servicios::positionRequest
  :super ros::object
  :slots (_x _y _z _roll _pitch _yaw _frame ))

(defmethod practica_servicios::positionRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    ((:frame __frame) "")
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   (setq _frame (string __frame))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:frame
   (&optional __frame)
   (if __frame (setq _frame __frame)) _frame)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; float64 _roll
    8
    ;; float64 _pitch
    8
    ;; float64 _yaw
    8
    ;; string _frame
    4 (length _frame)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _frame
       (write-long (length _frame) s) (princ _frame s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _roll
     (setq _roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitch
     (setq _pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _frame
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _frame (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass practica_servicios::positionResponse
  :super ros::object
  :slots (_success ))

(defmethod practica_servicios::positionResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass practica_servicios::position
  :super ros::object
  :slots ())

(setf (get practica_servicios::position :md5sum-) "67636d9847fb93c72071ab4322f7a01c")
(setf (get practica_servicios::position :datatype-) "practica_servicios/position")
(setf (get practica_servicios::position :request) practica_servicios::positionRequest)
(setf (get practica_servicios::position :response) practica_servicios::positionResponse)

(defmethod practica_servicios::positionRequest
  (:response () (instance practica_servicios::positionResponse :init)))

(setf (get practica_servicios::positionRequest :md5sum-) "67636d9847fb93c72071ab4322f7a01c")
(setf (get practica_servicios::positionRequest :datatype-) "practica_servicios/positionRequest")
(setf (get practica_servicios::positionRequest :definition-)
      "float64 x
float64 y
float64 z
float64 roll
float64 pitch
float64 yaw
string frame

---

bool success
")

(setf (get practica_servicios::positionResponse :md5sum-) "67636d9847fb93c72071ab4322f7a01c")
(setf (get practica_servicios::positionResponse :datatype-) "practica_servicios/positionResponse")
(setf (get practica_servicios::positionResponse :definition-)
      "float64 x
float64 y
float64 z
float64 roll
float64 pitch
float64 yaw
string frame

---

bool success
")



(provide :practica_servicios/position "67636d9847fb93c72071ab4322f7a01c")


