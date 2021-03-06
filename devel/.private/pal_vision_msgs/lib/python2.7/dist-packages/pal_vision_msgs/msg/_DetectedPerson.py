# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from pal_vision_msgs/DetectedPerson.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg
import pal_vision_msgs.msg
import std_msgs.msg

class DetectedPerson(genpy.Message):
  _md5sum = "f5d598391f8f6fb6645fe7d38b2e7101"
  _type = "pal_vision_msgs/DetectedPerson"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """## Contains data relative to the detection of a person

Header header

# ID associated to a detected person by the personServer
int64 objectId

# colour associated to the detected person by the personServer
# values from the personServer are in [0-255]
std_msgs/ColorRGBA boxColour

# detection confidence
float64 confidence

# 3D position of the person projected on the ground plane, expressed in the world frame
geometry_msgs/Point  position3D

# rectangular zone of the image that contains the person detected
pal_vision_msgs/Rectangle box

# rectangular zone of the image that may contain the face of the person detected
# if no face has been detected, faceBox = Rectangle(0, 0, 0, 0)
pal_vision_msgs/Rectangle faceBox


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
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: std_msgs/ColorRGBA
float32 r
float32 g
float32 b
float32 a

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: pal_vision_msgs/Rectangle
## Rectangle defined by a point, its width and height
# corresponds to the openCV struct : CvRect

# coordinates of the top left corner of the box
int64 x
int64 y

# wigth of the box
int64 width

# height of the box
int64 height
"""
  __slots__ = ['header','objectId','boxColour','confidence','position3D','box','faceBox']
  _slot_types = ['std_msgs/Header','int64','std_msgs/ColorRGBA','float64','geometry_msgs/Point','pal_vision_msgs/Rectangle','pal_vision_msgs/Rectangle']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,objectId,boxColour,confidence,position3D,box,faceBox

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(DetectedPerson, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.objectId is None:
        self.objectId = 0
      if self.boxColour is None:
        self.boxColour = std_msgs.msg.ColorRGBA()
      if self.confidence is None:
        self.confidence = 0.
      if self.position3D is None:
        self.position3D = geometry_msgs.msg.Point()
      if self.box is None:
        self.box = pal_vision_msgs.msg.Rectangle()
      if self.faceBox is None:
        self.faceBox = pal_vision_msgs.msg.Rectangle()
    else:
      self.header = std_msgs.msg.Header()
      self.objectId = 0
      self.boxColour = std_msgs.msg.ColorRGBA()
      self.confidence = 0.
      self.position3D = geometry_msgs.msg.Point()
      self.box = pal_vision_msgs.msg.Rectangle()
      self.faceBox = pal_vision_msgs.msg.Rectangle()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_q4f4d8q().pack(_x.objectId, _x.boxColour.r, _x.boxColour.g, _x.boxColour.b, _x.boxColour.a, _x.confidence, _x.position3D.x, _x.position3D.y, _x.position3D.z, _x.box.x, _x.box.y, _x.box.width, _x.box.height, _x.faceBox.x, _x.faceBox.y, _x.faceBox.width, _x.faceBox.height))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.boxColour is None:
        self.boxColour = std_msgs.msg.ColorRGBA()
      if self.position3D is None:
        self.position3D = geometry_msgs.msg.Point()
      if self.box is None:
        self.box = pal_vision_msgs.msg.Rectangle()
      if self.faceBox is None:
        self.faceBox = pal_vision_msgs.msg.Rectangle()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 120
      (_x.objectId, _x.boxColour.r, _x.boxColour.g, _x.boxColour.b, _x.boxColour.a, _x.confidence, _x.position3D.x, _x.position3D.y, _x.position3D.z, _x.box.x, _x.box.y, _x.box.width, _x.box.height, _x.faceBox.x, _x.faceBox.y, _x.faceBox.width, _x.faceBox.height,) = _get_struct_q4f4d8q().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_q4f4d8q().pack(_x.objectId, _x.boxColour.r, _x.boxColour.g, _x.boxColour.b, _x.boxColour.a, _x.confidence, _x.position3D.x, _x.position3D.y, _x.position3D.z, _x.box.x, _x.box.y, _x.box.width, _x.box.height, _x.faceBox.x, _x.faceBox.y, _x.faceBox.width, _x.faceBox.height))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.boxColour is None:
        self.boxColour = std_msgs.msg.ColorRGBA()
      if self.position3D is None:
        self.position3D = geometry_msgs.msg.Point()
      if self.box is None:
        self.box = pal_vision_msgs.msg.Rectangle()
      if self.faceBox is None:
        self.faceBox = pal_vision_msgs.msg.Rectangle()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 120
      (_x.objectId, _x.boxColour.r, _x.boxColour.g, _x.boxColour.b, _x.boxColour.a, _x.confidence, _x.position3D.x, _x.position3D.y, _x.position3D.z, _x.box.x, _x.box.y, _x.box.width, _x.box.height, _x.faceBox.x, _x.faceBox.y, _x.faceBox.width, _x.faceBox.height,) = _get_struct_q4f4d8q().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_q4f4d8q = None
def _get_struct_q4f4d8q():
    global _struct_q4f4d8q
    if _struct_q4f4d8q is None:
        _struct_q4f4d8q = struct.Struct("<q4f4d8q")
    return _struct_q4f4d8q
