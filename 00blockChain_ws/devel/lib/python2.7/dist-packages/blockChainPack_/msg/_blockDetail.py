# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from blockChainPack_/blockDetail.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class blockDetail(genpy.Message):
  _md5sum = "f78d193a3443341bccb41389748c5d9e"
  _type = "blockChainPack_/blockDetail"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """int64 blockNumber
int64 orderNumber
string timeStamp
string station
int64 productCode
string blockHash
string previousHash
"""
  __slots__ = ['blockNumber','orderNumber','timeStamp','station','productCode','blockHash','previousHash']
  _slot_types = ['int64','int64','string','string','int64','string','string']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       blockNumber,orderNumber,timeStamp,station,productCode,blockHash,previousHash

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(blockDetail, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.blockNumber is None:
        self.blockNumber = 0
      if self.orderNumber is None:
        self.orderNumber = 0
      if self.timeStamp is None:
        self.timeStamp = ''
      if self.station is None:
        self.station = ''
      if self.productCode is None:
        self.productCode = 0
      if self.blockHash is None:
        self.blockHash = ''
      if self.previousHash is None:
        self.previousHash = ''
    else:
      self.blockNumber = 0
      self.orderNumber = 0
      self.timeStamp = ''
      self.station = ''
      self.productCode = 0
      self.blockHash = ''
      self.previousHash = ''

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
      buff.write(_get_struct_2q().pack(_x.blockNumber, _x.orderNumber))
      _x = self.timeStamp
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.station
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      buff.write(_get_struct_q().pack(self.productCode))
      _x = self.blockHash
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.previousHash
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      _x = self
      start = end
      end += 16
      (_x.blockNumber, _x.orderNumber,) = _get_struct_2q().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.timeStamp = str[start:end].decode('utf-8')
      else:
        self.timeStamp = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.station = str[start:end].decode('utf-8')
      else:
        self.station = str[start:end]
      start = end
      end += 8
      (self.productCode,) = _get_struct_q().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.blockHash = str[start:end].decode('utf-8')
      else:
        self.blockHash = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.previousHash = str[start:end].decode('utf-8')
      else:
        self.previousHash = str[start:end]
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
      _x = self
      buff.write(_get_struct_2q().pack(_x.blockNumber, _x.orderNumber))
      _x = self.timeStamp
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.station
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      buff.write(_get_struct_q().pack(self.productCode))
      _x = self.blockHash
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.previousHash
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
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
      _x = self
      start = end
      end += 16
      (_x.blockNumber, _x.orderNumber,) = _get_struct_2q().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.timeStamp = str[start:end].decode('utf-8')
      else:
        self.timeStamp = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.station = str[start:end].decode('utf-8')
      else:
        self.station = str[start:end]
      start = end
      end += 8
      (self.productCode,) = _get_struct_q().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.blockHash = str[start:end].decode('utf-8')
      else:
        self.blockHash = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.previousHash = str[start:end].decode('utf-8')
      else:
        self.previousHash = str[start:end]
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
_struct_2q = None
def _get_struct_2q():
    global _struct_2q
    if _struct_2q is None:
        _struct_2q = struct.Struct("<2q")
    return _struct_2q
