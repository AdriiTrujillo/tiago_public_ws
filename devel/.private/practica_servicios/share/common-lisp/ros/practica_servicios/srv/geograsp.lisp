; Auto-generated. Do not edit!


(cl:in-package practica_servicios-srv)


;//! \htmlinclude geograsp-request.msg.html

(cl:defclass <geograsp-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass geograsp-request (<geograsp-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <geograsp-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'geograsp-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name practica_servicios-srv:<geograsp-request> is deprecated: use practica_servicios-srv:geograsp-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <geograsp-request>) ostream)
  "Serializes a message object of type '<geograsp-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <geograsp-request>) istream)
  "Deserializes a message object of type '<geograsp-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<geograsp-request>)))
  "Returns string type for a service object of type '<geograsp-request>"
  "practica_servicios/geograspRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'geograsp-request)))
  "Returns string type for a service object of type 'geograsp-request"
  "practica_servicios/geograspRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<geograsp-request>)))
  "Returns md5sum for a message object of type '<geograsp-request>"
  "f99e2553a5b4745dfc6f3efd371b9886")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'geograsp-request)))
  "Returns md5sum for a message object of type 'geograsp-request"
  "f99e2553a5b4745dfc6f3efd371b9886")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<geograsp-request>)))
  "Returns full string definition for message of type '<geograsp-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'geograsp-request)))
  "Returns full string definition for message of type 'geograsp-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <geograsp-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <geograsp-request>))
  "Converts a ROS message object to a list"
  (cl:list 'geograsp-request
))
;//! \htmlinclude geograsp-response.msg.html

(cl:defclass <geograsp-response> (roslisp-msg-protocol:ros-message)
  ((p
    :reader p
    :initarg :p
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass geograsp-response (<geograsp-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <geograsp-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'geograsp-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name practica_servicios-srv:<geograsp-response> is deprecated: use practica_servicios-srv:geograsp-response instead.")))

(cl:ensure-generic-function 'p-val :lambda-list '(m))
(cl:defmethod p-val ((m <geograsp-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader practica_servicios-srv:p-val is deprecated.  Use practica_servicios-srv:p instead.")
  (p m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <geograsp-response>) ostream)
  "Serializes a message object of type '<geograsp-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'p) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <geograsp-response>) istream)
  "Deserializes a message object of type '<geograsp-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'p) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<geograsp-response>)))
  "Returns string type for a service object of type '<geograsp-response>"
  "practica_servicios/geograspResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'geograsp-response)))
  "Returns string type for a service object of type 'geograsp-response"
  "practica_servicios/geograspResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<geograsp-response>)))
  "Returns md5sum for a message object of type '<geograsp-response>"
  "f99e2553a5b4745dfc6f3efd371b9886")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'geograsp-response)))
  "Returns md5sum for a message object of type 'geograsp-response"
  "f99e2553a5b4745dfc6f3efd371b9886")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<geograsp-response>)))
  "Returns full string definition for message of type '<geograsp-response>"
  (cl:format cl:nil "geometry_msgs/Pose p~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'geograsp-response)))
  "Returns full string definition for message of type 'geograsp-response"
  (cl:format cl:nil "geometry_msgs/Pose p~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <geograsp-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'p))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <geograsp-response>))
  "Converts a ROS message object to a list"
  (cl:list 'geograsp-response
    (cl:cons ':p (p msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'geograsp)))
  'geograsp-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'geograsp)))
  'geograsp-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'geograsp)))
  "Returns string type for a service object of type '<geograsp>"
  "practica_servicios/geograsp")