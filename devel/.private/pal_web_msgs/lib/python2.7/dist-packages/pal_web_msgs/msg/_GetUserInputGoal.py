# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from pal_web_msgs/GetUserInputGoal.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import genpy
import pal_interaction_msgs.msg
import pal_web_msgs.msg

class GetUserInputGoal(genpy.Message):
  _md5sum = "e48be2a5e78e65df9879f65b0e9d735d"
  _type = "pal_web_msgs/GetUserInputGoal"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
pal_web_msgs/WebGoTo web_go_to # Web to display for requesting feedback
pal_interaction_msgs/TtsGoal question_tts # TTS question, asked before waiting for feedback
string[] valid_asr_inputs # empty is no ASR, can be regex
string asr_language # empty is current default
duration asr_timeout
bool retry_asr
pal_interaction_msgs/TtsGoal retry_tts # If retrying, say this setence
bool wait_for_interaction # If true, wait for an interaction before starting the ASR

================================================================================
MSG: pal_web_msgs/WebGoTo
uint8 IMAGE = 0
uint8 VIDEO = 1
uint8 URI   = 2
uint8 type # one of the enum above

string value # Destination (an image, a video or a uri)

================================================================================
MSG: pal_interaction_msgs/TtsGoal
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
## goal definition

# utterance will contain indications to construct
# the text to be spoken.
# It must be specified in a section/key format 
# for internationalisation. The actual text will
# be obtained from configuration files as in pal_tts_cfg pkg.
 
I18nText text
TtsText rawtext

# This is to suggest a voice name to the 
# tts engine. For the same language we might have
# a variety of voices available, and this variable 
# is to choose one among them. 
# (not implemented yet)
string speakerName

# Time to wait before synthesising the text itself.
# It can be used to produced delayed speech.
float64 wait_before_speaking


================================================================================
MSG: pal_interaction_msgs/I18nText
# section/key is used as in examples in the pal_tts_cfg pkg.
string section
string key

# language id, must be speficied using RFC 3066
string lang_id

# arguments contain the values by which 
# occurrences of '%s' will be replaced in the 
# main text.
# This only supports up to 2 arguments and no recursion.
# However, recursion and more argumnents are
# planned to be supported in the future.
I18nArgument[] arguments

================================================================================
MSG: pal_interaction_msgs/I18nArgument
# section key, override the value in expanded.
# Use expanded for text that do not need expansion.
# Please note that expanded here will not be translated 
# to any language.

string section
string key
string expanded


================================================================================
MSG: pal_interaction_msgs/TtsText
# this message is to specify 
# raw text to the TTS server. 

string text

# Language id in RFC 3066 format
# This field is mandatory
string lang_id"""
  __slots__ = ['web_go_to','question_tts','valid_asr_inputs','asr_language','asr_timeout','retry_asr','retry_tts','wait_for_interaction']
  _slot_types = ['pal_web_msgs/WebGoTo','pal_interaction_msgs/TtsGoal','string[]','string','duration','bool','pal_interaction_msgs/TtsGoal','bool']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       web_go_to,question_tts,valid_asr_inputs,asr_language,asr_timeout,retry_asr,retry_tts,wait_for_interaction

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(GetUserInputGoal, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.web_go_to is None:
        self.web_go_to = pal_web_msgs.msg.WebGoTo()
      if self.question_tts is None:
        self.question_tts = pal_interaction_msgs.msg.TtsGoal()
      if self.valid_asr_inputs is None:
        self.valid_asr_inputs = []
      if self.asr_language is None:
        self.asr_language = ''
      if self.asr_timeout is None:
        self.asr_timeout = genpy.Duration()
      if self.retry_asr is None:
        self.retry_asr = False
      if self.retry_tts is None:
        self.retry_tts = pal_interaction_msgs.msg.TtsGoal()
      if self.wait_for_interaction is None:
        self.wait_for_interaction = False
    else:
      self.web_go_to = pal_web_msgs.msg.WebGoTo()
      self.question_tts = pal_interaction_msgs.msg.TtsGoal()
      self.valid_asr_inputs = []
      self.asr_language = ''
      self.asr_timeout = genpy.Duration()
      self.retry_asr = False
      self.retry_tts = pal_interaction_msgs.msg.TtsGoal()
      self.wait_for_interaction = False

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
      _x = self.web_go_to.type
      buff.write(_get_struct_B().pack(_x))
      _x = self.web_go_to.value
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.question_tts.text.section
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.question_tts.text.key
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.question_tts.text.lang_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      length = len(self.question_tts.text.arguments)
      buff.write(_struct_I.pack(length))
      for val1 in self.question_tts.text.arguments:
        _x = val1.section
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.key
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.expanded
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.question_tts.rawtext.text
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.question_tts.rawtext.lang_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.question_tts.speakerName
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.question_tts.wait_before_speaking
      buff.write(_get_struct_d().pack(_x))
      length = len(self.valid_asr_inputs)
      buff.write(_struct_I.pack(length))
      for val1 in self.valid_asr_inputs:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        buff.write(struct.Struct('<I%ss'%length).pack(length, val1))
      _x = self.asr_language
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_2iB().pack(_x.asr_timeout.secs, _x.asr_timeout.nsecs, _x.retry_asr))
      _x = self.retry_tts.text.section
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.retry_tts.text.key
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.retry_tts.text.lang_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      length = len(self.retry_tts.text.arguments)
      buff.write(_struct_I.pack(length))
      for val1 in self.retry_tts.text.arguments:
        _x = val1.section
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.key
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.expanded
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.retry_tts.rawtext.text
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.retry_tts.rawtext.lang_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.retry_tts.speakerName
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_dB().pack(_x.retry_tts.wait_before_speaking, _x.wait_for_interaction))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.web_go_to is None:
        self.web_go_to = pal_web_msgs.msg.WebGoTo()
      if self.question_tts is None:
        self.question_tts = pal_interaction_msgs.msg.TtsGoal()
      if self.asr_timeout is None:
        self.asr_timeout = genpy.Duration()
      if self.retry_tts is None:
        self.retry_tts = pal_interaction_msgs.msg.TtsGoal()
      end = 0
      start = end
      end += 1
      (self.web_go_to.type,) = _get_struct_B().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.web_go_to.value = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.web_go_to.value = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.question_tts.text.section = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.question_tts.text.section = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.question_tts.text.key = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.question_tts.text.key = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.question_tts.text.lang_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.question_tts.text.lang_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.question_tts.text.arguments = []
      for i in range(0, length):
        val1 = pal_interaction_msgs.msg.I18nArgument()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.section = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.section = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.key = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.key = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.expanded = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.expanded = str[start:end]
        self.question_tts.text.arguments.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.question_tts.rawtext.text = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.question_tts.rawtext.text = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.question_tts.rawtext.lang_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.question_tts.rawtext.lang_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.question_tts.speakerName = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.question_tts.speakerName = str[start:end]
      start = end
      end += 8
      (self.question_tts.wait_before_speaking,) = _get_struct_d().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.valid_asr_inputs = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1 = str[start:end]
        self.valid_asr_inputs.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.asr_language = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.asr_language = str[start:end]
      _x = self
      start = end
      end += 9
      (_x.asr_timeout.secs, _x.asr_timeout.nsecs, _x.retry_asr,) = _get_struct_2iB().unpack(str[start:end])
      self.retry_asr = bool(self.retry_asr)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.retry_tts.text.section = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.retry_tts.text.section = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.retry_tts.text.key = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.retry_tts.text.key = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.retry_tts.text.lang_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.retry_tts.text.lang_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.retry_tts.text.arguments = []
      for i in range(0, length):
        val1 = pal_interaction_msgs.msg.I18nArgument()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.section = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.section = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.key = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.key = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.expanded = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.expanded = str[start:end]
        self.retry_tts.text.arguments.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.retry_tts.rawtext.text = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.retry_tts.rawtext.text = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.retry_tts.rawtext.lang_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.retry_tts.rawtext.lang_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.retry_tts.speakerName = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.retry_tts.speakerName = str[start:end]
      _x = self
      start = end
      end += 9
      (_x.retry_tts.wait_before_speaking, _x.wait_for_interaction,) = _get_struct_dB().unpack(str[start:end])
      self.wait_for_interaction = bool(self.wait_for_interaction)
      self.asr_timeout.canon()
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
      _x = self.web_go_to.type
      buff.write(_get_struct_B().pack(_x))
      _x = self.web_go_to.value
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.question_tts.text.section
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.question_tts.text.key
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.question_tts.text.lang_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      length = len(self.question_tts.text.arguments)
      buff.write(_struct_I.pack(length))
      for val1 in self.question_tts.text.arguments:
        _x = val1.section
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.key
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.expanded
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.question_tts.rawtext.text
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.question_tts.rawtext.lang_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.question_tts.speakerName
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.question_tts.wait_before_speaking
      buff.write(_get_struct_d().pack(_x))
      length = len(self.valid_asr_inputs)
      buff.write(_struct_I.pack(length))
      for val1 in self.valid_asr_inputs:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        buff.write(struct.Struct('<I%ss'%length).pack(length, val1))
      _x = self.asr_language
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_2iB().pack(_x.asr_timeout.secs, _x.asr_timeout.nsecs, _x.retry_asr))
      _x = self.retry_tts.text.section
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.retry_tts.text.key
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.retry_tts.text.lang_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      length = len(self.retry_tts.text.arguments)
      buff.write(_struct_I.pack(length))
      for val1 in self.retry_tts.text.arguments:
        _x = val1.section
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.key
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.expanded
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.retry_tts.rawtext.text
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.retry_tts.rawtext.lang_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.retry_tts.speakerName
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_dB().pack(_x.retry_tts.wait_before_speaking, _x.wait_for_interaction))
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
      if self.web_go_to is None:
        self.web_go_to = pal_web_msgs.msg.WebGoTo()
      if self.question_tts is None:
        self.question_tts = pal_interaction_msgs.msg.TtsGoal()
      if self.asr_timeout is None:
        self.asr_timeout = genpy.Duration()
      if self.retry_tts is None:
        self.retry_tts = pal_interaction_msgs.msg.TtsGoal()
      end = 0
      start = end
      end += 1
      (self.web_go_to.type,) = _get_struct_B().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.web_go_to.value = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.web_go_to.value = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.question_tts.text.section = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.question_tts.text.section = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.question_tts.text.key = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.question_tts.text.key = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.question_tts.text.lang_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.question_tts.text.lang_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.question_tts.text.arguments = []
      for i in range(0, length):
        val1 = pal_interaction_msgs.msg.I18nArgument()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.section = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.section = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.key = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.key = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.expanded = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.expanded = str[start:end]
        self.question_tts.text.arguments.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.question_tts.rawtext.text = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.question_tts.rawtext.text = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.question_tts.rawtext.lang_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.question_tts.rawtext.lang_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.question_tts.speakerName = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.question_tts.speakerName = str[start:end]
      start = end
      end += 8
      (self.question_tts.wait_before_speaking,) = _get_struct_d().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.valid_asr_inputs = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1 = str[start:end]
        self.valid_asr_inputs.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.asr_language = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.asr_language = str[start:end]
      _x = self
      start = end
      end += 9
      (_x.asr_timeout.secs, _x.asr_timeout.nsecs, _x.retry_asr,) = _get_struct_2iB().unpack(str[start:end])
      self.retry_asr = bool(self.retry_asr)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.retry_tts.text.section = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.retry_tts.text.section = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.retry_tts.text.key = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.retry_tts.text.key = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.retry_tts.text.lang_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.retry_tts.text.lang_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.retry_tts.text.arguments = []
      for i in range(0, length):
        val1 = pal_interaction_msgs.msg.I18nArgument()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.section = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.section = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.key = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.key = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.expanded = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.expanded = str[start:end]
        self.retry_tts.text.arguments.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.retry_tts.rawtext.text = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.retry_tts.rawtext.text = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.retry_tts.rawtext.lang_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.retry_tts.rawtext.lang_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.retry_tts.speakerName = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.retry_tts.speakerName = str[start:end]
      _x = self
      start = end
      end += 9
      (_x.retry_tts.wait_before_speaking, _x.wait_for_interaction,) = _get_struct_dB().unpack(str[start:end])
      self.wait_for_interaction = bool(self.wait_for_interaction)
      self.asr_timeout.canon()
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2iB = None
def _get_struct_2iB():
    global _struct_2iB
    if _struct_2iB is None:
        _struct_2iB = struct.Struct("<2iB")
    return _struct_2iB
_struct_B = None
def _get_struct_B():
    global _struct_B
    if _struct_B is None:
        _struct_B = struct.Struct("<B")
    return _struct_B
_struct_d = None
def _get_struct_d():
    global _struct_d
    if _struct_d is None:
        _struct_d = struct.Struct("<d")
    return _struct_d
_struct_dB = None
def _get_struct_dB():
    global _struct_dB
    if _struct_dB is None:
        _struct_dB = struct.Struct("<dB")
    return _struct_dB
