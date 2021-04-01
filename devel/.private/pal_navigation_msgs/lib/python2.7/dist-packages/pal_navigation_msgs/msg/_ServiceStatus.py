# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from pal_navigation_msgs/ServiceStatus.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import genpy

class ServiceStatus(genpy.Message):
  _md5sum = "b734cea5bf73c81e5fb0d99553451daa"
  _type = "pal_navigation_msgs/ServiceStatus"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# Navigation ServiceStatus msg 
string serviceName

#true if the service has been started
bool    is_running

#expected frequency of control loop (in hertz)
float32 update_frequency

#Timestamp of the latest loop cycle execution
time    latest_run_time

#true if the service is running and working fine
bool    status
"""
  __slots__ = ['serviceName','is_running','update_frequency','latest_run_time','status']
  _slot_types = ['string','bool','float32','time','bool']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       serviceName,is_running,update_frequency,latest_run_time,status

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ServiceStatus, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.serviceName is None:
        self.serviceName = ''
      if self.is_running is None:
        self.is_running = False
      if self.update_frequency is None:
        self.update_frequency = 0.
      if self.latest_run_time is None:
        self.latest_run_time = genpy.Time()
      if self.status is None:
        self.status = False
    else:
      self.serviceName = ''
      self.is_running = False
      self.update_frequency = 0.
      self.latest_run_time = genpy.Time()
      self.status = False

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
      _x = self.serviceName
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_Bf2IB().pack(_x.is_running, _x.update_frequency, _x.latest_run_time.secs, _x.latest_run_time.nsecs, _x.status))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.latest_run_time is None:
        self.latest_run_time = genpy.Time()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.serviceName = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.serviceName = str[start:end]
      _x = self
      start = end
      end += 14
      (_x.is_running, _x.update_frequency, _x.latest_run_time.secs, _x.latest_run_time.nsecs, _x.status,) = _get_struct_Bf2IB().unpack(str[start:end])
      self.is_running = bool(self.is_running)
      self.status = bool(self.status)
      self.latest_run_time.canon()
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
      _x = self.serviceName
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_Bf2IB().pack(_x.is_running, _x.update_frequency, _x.latest_run_time.secs, _x.latest_run_time.nsecs, _x.status))
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
      if self.latest_run_time is None:
        self.latest_run_time = genpy.Time()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.serviceName = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.serviceName = str[start:end]
      _x = self
      start = end
      end += 14
      (_x.is_running, _x.update_frequency, _x.latest_run_time.secs, _x.latest_run_time.nsecs, _x.status,) = _get_struct_Bf2IB().unpack(str[start:end])
      self.is_running = bool(self.is_running)
      self.status = bool(self.status)
      self.latest_run_time.canon()
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_Bf2IB = None
def _get_struct_Bf2IB():
    global _struct_Bf2IB
    if _struct_Bf2IB is None:
        _struct_Bf2IB = struct.Struct("<Bf2IB")
    return _struct_Bf2IB
