# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from blockChainPack_/rewriteNode.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class rewriteNode(genpy.Message):
  _md5sum = "b722726d77ee12b8172165f1aabcd67c"
  _type = "blockChainPack_/rewriteNode"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """string SblockTimeStamp
string SblockTrans
int64 SblockProductCode
string SblockHash
string SblockPreviousHash
int64 SCarrierNumber

int64 firstIndex
int64 secondIndex
int64 thirdIndex
"""
  __slots__ = ['SblockTimeStamp','SblockTrans','SblockProductCode','SblockHash','SblockPreviousHash','SCarrierNumber','firstIndex','secondIndex','thirdIndex']
  _slot_types = ['string','string','int64','string','string','int64','int64','int64','int64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       SblockTimeStamp,SblockTrans,SblockProductCode,SblockHash,SblockPreviousHash,SCarrierNumber,firstIndex,secondIndex,thirdIndex

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(rewriteNode, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.SblockTimeStamp is None:
        self.SblockTimeStamp = ''
      if self.SblockTrans is None:
        self.SblockTrans = ''
      if self.SblockProductCode is None:
        self.SblockProductCode = 0
      if self.SblockHash is None:
        self.SblockHash = ''
      if self.SblockPreviousHash is None:
        self.SblockPreviousHash = ''
      if self.SCarrierNumber is None:
        self.SCarrierNumber = 0
      if self.firstIndex is None:
        self.firstIndex = 0
      if self.secondIndex is None:
        self.secondIndex = 0
      if self.thirdIndex is None:
        self.thirdIndex = 0
    else:
      self.SblockTimeStamp = ''
      self.SblockTrans = ''
      self.SblockProductCode = 0
      self.SblockHash = ''
      self.SblockPreviousHash = ''
      self.SCarrierNumber = 0
      self.firstIndex = 0
      self.secondIndex = 0
      self.thirdIndex = 0

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
      _x = self.SblockTimeStamp
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.SblockTrans
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      buff.write(_get_struct_q().pack(self.SblockProductCode))
      _x = self.SblockHash
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.SblockPreviousHash
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_4q().pack(_x.SCarrierNumber, _x.firstIndex, _x.secondIndex, _x.thirdIndex))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.SblockTimeStamp = str[start:end].decode('utf-8')
      else:
        self.SblockTimeStamp = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.SblockTrans = str[start:end].decode('utf-8')
      else:
        self.SblockTrans = str[start:end]
      start = end
      end += 8
      (self.SblockProductCode,) = _get_struct_q().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.SblockHash = str[start:end].decode('utf-8')
      else:
        self.SblockHash = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.SblockPreviousHash = str[start:end].decode('utf-8')
      else:
        self.SblockPreviousHash = str[start:end]
      _x = self
      start = end
      end += 32
      (_x.SCarrierNumber, _x.firstIndex, _x.secondIndex, _x.thirdIndex,) = _get_struct_4q().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self.SblockTimeStamp
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.SblockTrans
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      buff.write(_get_struct_q().pack(self.SblockProductCode))
      _x = self.SblockHash
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.SblockPreviousHash
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_4q().pack(_x.SCarrierNumber, _x.firstIndex, _x.secondIndex, _x.thirdIndex))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.SblockTimeStamp = str[start:end].decode('utf-8')
      else:
        self.SblockTimeStamp = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.SblockTrans = str[start:end].decode('utf-8')
      else:
        self.SblockTrans = str[start:end]
      start = end
      end += 8
      (self.SblockProductCode,) = _get_struct_q().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.SblockHash = str[start:end].decode('utf-8')
      else:
        self.SblockHash = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.SblockPreviousHash = str[start:end].decode('utf-8')
      else:
        self.SblockPreviousHash = str[start:end]
      _x = self
      start = end
      end += 32
      (_x.SCarrierNumber, _x.firstIndex, _x.secondIndex, _x.thirdIndex,) = _get_struct_4q().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_q = None
def _get_struct_q():
    global _struct_q
    if _struct_q is None:
        _struct_q = struct.Struct("<q")
    return _struct_q
_struct_4q = None
def _get_struct_4q():
    global _struct_4q
    if _struct_4q is None:
        _struct_4q = struct.Struct("<4q")
    return _struct_4q
