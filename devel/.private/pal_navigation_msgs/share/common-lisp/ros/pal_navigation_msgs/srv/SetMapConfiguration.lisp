; Auto-generated. Do not edit!


(cl:in-package pal_navigation_msgs-srv)


;//! \htmlinclude SetMapConfiguration-request.msg.html

(cl:defclass <SetMapConfiguration-request> (roslisp-msg-protocol:ros-message)
  ((map_config
    :reader map_config
    :initarg :map_config
    :type pal_navigation_msgs-msg:MapConfiguration
    :initform (cl:make-instance 'pal_navigation_msgs-msg:MapConfiguration)))
)

(cl:defclass SetMapConfiguration-request (<SetMapConfiguration-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetMapConfiguration-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetMapConfiguration-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pal_navigation_msgs-srv:<SetMapConfiguration-request> is deprecated: use pal_navigation_msgs-srv:SetMapConfiguration-request instead.")))

(cl:ensure-generic-function 'map_config-val :lambda-list '(m))
(cl:defmethod map_config-val ((m <SetMapConfiguration-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pal_navigation_msgs-srv:map_config-val is deprecated.  Use pal_navigation_msgs-srv:map_config instead.")
  (map_config m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetMapConfiguration-request>) ostream)
  "Serializes a message object of type '<SetMapConfiguration-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'map_config) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetMapConfiguration-request>) istream)
  "Deserializes a message object of type '<SetMapConfiguration-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'map_config) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetMapConfiguration-request>)))
  "Returns string type for a service object of type '<SetMapConfiguration-request>"
  "pal_navigation_msgs/SetMapConfigurationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMapConfiguration-request)))
  "Returns string type for a service object of type 'SetMapConfiguration-request"
  "pal_navigation_msgs/SetMapConfigurationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetMapConfiguration-request>)))
  "Returns md5sum for a message object of type '<SetMapConfiguration-request>"
  "03fc2970c7709c1aa00a0077b9478e6f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetMapConfiguration-request)))
  "Returns md5sum for a message object of type 'SetMapConfiguration-request"
  "03fc2970c7709c1aa00a0077b9478e6f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetMapConfiguration-request>)))
  "Returns full string definition for message of type '<SetMapConfiguration-request>"
  (cl:format cl:nil "~%~%pal_navigation_msgs/MapConfiguration   map_config~%~%================================================================================~%MSG: pal_navigation_msgs/MapConfiguration~%#Configuration of a map~%int32 numberOfSubMaps~%~%#Points of interest of the map~%pal_navigation_msgs/POI pois~%~%#Virtual obstacles of the map~%pal_navigation_msgs/POI vo~%~%~%#Zones of interest of the map~%pal_navigation_msgs/POI zoi~%~%pal_navigation_msgs/VisualLocDB visualLocDb~%~%#Real (ugly) map ~%nav_msgs/OccupancyGrid navigation_map~%~%#Pretty map~%sensor_msgs/Image user_map~%~%# Deprecated, now the user_map must be transformed to match the scale/~%# orientation of the navigation_map~%#Transformation between ugly and pretty map~%pal_navigation_msgs/NiceMapTransformation transform~%~%~%~%================================================================================~%MSG: pal_navigation_msgs/POI~%# Poi (Point of interest)~%~%sensor_msgs/PointCloud points~%~%std_msgs/String[]      ids~%~%std_msgs/String        map_id~%~%================================================================================~%MSG: sensor_msgs/PointCloud~%# This message holds a collection of 3d points, plus optional additional~%# information about each point.~%~%# Time of sensor data acquisition, coordinate frame ID.~%Header header~%~%# Array of 3d points. Each Point32 should be interpreted as a 3d point~%# in the frame given in the header.~%geometry_msgs/Point32[] points~%~%# Each channel should have the same number of elements as points array,~%# and the data in each channel should correspond 1:1 with each point.~%# Channel names in common practice are listed in ChannelFloat32.msg.~%ChannelFloat32[] channels~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%================================================================================~%MSG: sensor_msgs/ChannelFloat32~%# This message is used by the PointCloud message to hold optional data~%# associated with each point in the cloud. The length of the values~%# array should be the same as the length of the points array in the~%# PointCloud, and each value should be associated with the corresponding~%# point.~%~%# Channel names in existing practice include:~%#   \"u\", \"v\" - row and column (respectively) in the left stereo image.~%#              This is opposite to usual conventions but remains for~%#              historical reasons. The newer PointCloud2 message has no~%#              such problem.~%#   \"rgb\" - For point clouds produced by color stereo cameras. uint8~%#           (R,G,B) values packed into the least significant 24 bits,~%#           in order.~%#   \"intensity\" - laser or pixel intensity.~%#   \"distance\"~%~%# The channel name should give semantics of the channel (e.g.~%# \"intensity\" instead of \"value\").~%string name~%~%# The values array should be 1-1 with the elements of the associated~%# PointCloud.~%float32[] values~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: pal_navigation_msgs/VisualLocDB~%#Contents of the 3 binary files that contain the visual localization DB~%~%uint8[] documents~%uint8[] tree~%uint8[] weights~%~%================================================================================~%MSG: nav_msgs/OccupancyGrid~%# This represents a 2-D grid map, in which each cell represents the probability of~%# occupancy.~%~%Header header ~%~%#MetaData for the map~%MapMetaData info~%~%# The map data, in row-major order, starting with (0,0).  Occupancy~%# probabilities are in the range [0,100].  Unknown is -1.~%int8[] data~%~%================================================================================~%MSG: nav_msgs/MapMetaData~%# This hold basic information about the characterists of the OccupancyGrid~%~%# The time at which the map was loaded~%time map_load_time~%# The map resolution [m/cell]~%float32 resolution~%# Map width [cells]~%uint32 width~%# Map height [cells]~%uint32 height~%# The origin of the map [m, m, rad].  This is the real-world pose of the~%# cell (0,0) in the map.~%geometry_msgs/Pose origin~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: pal_navigation_msgs/NiceMapTransformation~%float64 x ~%float64 y~%float64 rotYawRad # Yaw rotation in rads~%float64 scale~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetMapConfiguration-request)))
  "Returns full string definition for message of type 'SetMapConfiguration-request"
  (cl:format cl:nil "~%~%pal_navigation_msgs/MapConfiguration   map_config~%~%================================================================================~%MSG: pal_navigation_msgs/MapConfiguration~%#Configuration of a map~%int32 numberOfSubMaps~%~%#Points of interest of the map~%pal_navigation_msgs/POI pois~%~%#Virtual obstacles of the map~%pal_navigation_msgs/POI vo~%~%~%#Zones of interest of the map~%pal_navigation_msgs/POI zoi~%~%pal_navigation_msgs/VisualLocDB visualLocDb~%~%#Real (ugly) map ~%nav_msgs/OccupancyGrid navigation_map~%~%#Pretty map~%sensor_msgs/Image user_map~%~%# Deprecated, now the user_map must be transformed to match the scale/~%# orientation of the navigation_map~%#Transformation between ugly and pretty map~%pal_navigation_msgs/NiceMapTransformation transform~%~%~%~%================================================================================~%MSG: pal_navigation_msgs/POI~%# Poi (Point of interest)~%~%sensor_msgs/PointCloud points~%~%std_msgs/String[]      ids~%~%std_msgs/String        map_id~%~%================================================================================~%MSG: sensor_msgs/PointCloud~%# This message holds a collection of 3d points, plus optional additional~%# information about each point.~%~%# Time of sensor data acquisition, coordinate frame ID.~%Header header~%~%# Array of 3d points. Each Point32 should be interpreted as a 3d point~%# in the frame given in the header.~%geometry_msgs/Point32[] points~%~%# Each channel should have the same number of elements as points array,~%# and the data in each channel should correspond 1:1 with each point.~%# Channel names in common practice are listed in ChannelFloat32.msg.~%ChannelFloat32[] channels~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%================================================================================~%MSG: sensor_msgs/ChannelFloat32~%# This message is used by the PointCloud message to hold optional data~%# associated with each point in the cloud. The length of the values~%# array should be the same as the length of the points array in the~%# PointCloud, and each value should be associated with the corresponding~%# point.~%~%# Channel names in existing practice include:~%#   \"u\", \"v\" - row and column (respectively) in the left stereo image.~%#              This is opposite to usual conventions but remains for~%#              historical reasons. The newer PointCloud2 message has no~%#              such problem.~%#   \"rgb\" - For point clouds produced by color stereo cameras. uint8~%#           (R,G,B) values packed into the least significant 24 bits,~%#           in order.~%#   \"intensity\" - laser or pixel intensity.~%#   \"distance\"~%~%# The channel name should give semantics of the channel (e.g.~%# \"intensity\" instead of \"value\").~%string name~%~%# The values array should be 1-1 with the elements of the associated~%# PointCloud.~%float32[] values~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: pal_navigation_msgs/VisualLocDB~%#Contents of the 3 binary files that contain the visual localization DB~%~%uint8[] documents~%uint8[] tree~%uint8[] weights~%~%================================================================================~%MSG: nav_msgs/OccupancyGrid~%# This represents a 2-D grid map, in which each cell represents the probability of~%# occupancy.~%~%Header header ~%~%#MetaData for the map~%MapMetaData info~%~%# The map data, in row-major order, starting with (0,0).  Occupancy~%# probabilities are in the range [0,100].  Unknown is -1.~%int8[] data~%~%================================================================================~%MSG: nav_msgs/MapMetaData~%# This hold basic information about the characterists of the OccupancyGrid~%~%# The time at which the map was loaded~%time map_load_time~%# The map resolution [m/cell]~%float32 resolution~%# Map width [cells]~%uint32 width~%# Map height [cells]~%uint32 height~%# The origin of the map [m, m, rad].  This is the real-world pose of the~%# cell (0,0) in the map.~%geometry_msgs/Pose origin~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: pal_navigation_msgs/NiceMapTransformation~%float64 x ~%float64 y~%float64 rotYawRad # Yaw rotation in rads~%float64 scale~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetMapConfiguration-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'map_config))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetMapConfiguration-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetMapConfiguration-request
    (cl:cons ':map_config (map_config msg))
))
;//! \htmlinclude SetMapConfiguration-response.msg.html

(cl:defclass <SetMapConfiguration-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetMapConfiguration-response (<SetMapConfiguration-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetMapConfiguration-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetMapConfiguration-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pal_navigation_msgs-srv:<SetMapConfiguration-response> is deprecated: use pal_navigation_msgs-srv:SetMapConfiguration-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetMapConfiguration-response>) ostream)
  "Serializes a message object of type '<SetMapConfiguration-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetMapConfiguration-response>) istream)
  "Deserializes a message object of type '<SetMapConfiguration-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetMapConfiguration-response>)))
  "Returns string type for a service object of type '<SetMapConfiguration-response>"
  "pal_navigation_msgs/SetMapConfigurationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMapConfiguration-response)))
  "Returns string type for a service object of type 'SetMapConfiguration-response"
  "pal_navigation_msgs/SetMapConfigurationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetMapConfiguration-response>)))
  "Returns md5sum for a message object of type '<SetMapConfiguration-response>"
  "03fc2970c7709c1aa00a0077b9478e6f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetMapConfiguration-response)))
  "Returns md5sum for a message object of type 'SetMapConfiguration-response"
  "03fc2970c7709c1aa00a0077b9478e6f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetMapConfiguration-response>)))
  "Returns full string definition for message of type '<SetMapConfiguration-response>"
  (cl:format cl:nil "~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetMapConfiguration-response)))
  "Returns full string definition for message of type 'SetMapConfiguration-response"
  (cl:format cl:nil "~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetMapConfiguration-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetMapConfiguration-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetMapConfiguration-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetMapConfiguration)))
  'SetMapConfiguration-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetMapConfiguration)))
  'SetMapConfiguration-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMapConfiguration)))
  "Returns string type for a service object of type '<SetMapConfiguration>"
  "pal_navigation_msgs/SetMapConfiguration")