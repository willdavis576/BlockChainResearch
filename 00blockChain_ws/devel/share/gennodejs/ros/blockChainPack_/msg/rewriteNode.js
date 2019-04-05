// Auto-generated. Do not edit!

// (in-package blockChainPack_.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class rewriteNode {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.SblockTimeStamp = null;
      this.SblockTrans = null;
      this.SblockProductCode = null;
      this.SblockHash = null;
      this.SblockPreviousHash = null;
      this.SCarrierNumber = null;
      this.firstIndex = null;
      this.secondIndex = null;
      this.thirdIndex = null;
    }
    else {
      if (initObj.hasOwnProperty('SblockTimeStamp')) {
        this.SblockTimeStamp = initObj.SblockTimeStamp
      }
      else {
        this.SblockTimeStamp = '';
      }
      if (initObj.hasOwnProperty('SblockTrans')) {
        this.SblockTrans = initObj.SblockTrans
      }
      else {
        this.SblockTrans = '';
      }
      if (initObj.hasOwnProperty('SblockProductCode')) {
        this.SblockProductCode = initObj.SblockProductCode
      }
      else {
        this.SblockProductCode = '';
      }
      if (initObj.hasOwnProperty('SblockHash')) {
        this.SblockHash = initObj.SblockHash
      }
      else {
        this.SblockHash = '';
      }
      if (initObj.hasOwnProperty('SblockPreviousHash')) {
        this.SblockPreviousHash = initObj.SblockPreviousHash
      }
      else {
        this.SblockPreviousHash = '';
      }
      if (initObj.hasOwnProperty('SCarrierNumber')) {
        this.SCarrierNumber = initObj.SCarrierNumber
      }
      else {
        this.SCarrierNumber = '';
      }
      if (initObj.hasOwnProperty('firstIndex')) {
        this.firstIndex = initObj.firstIndex
      }
      else {
        this.firstIndex = 0;
      }
      if (initObj.hasOwnProperty('secondIndex')) {
        this.secondIndex = initObj.secondIndex
      }
      else {
        this.secondIndex = 0;
      }
      if (initObj.hasOwnProperty('thirdIndex')) {
        this.thirdIndex = initObj.thirdIndex
      }
      else {
        this.thirdIndex = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rewriteNode
    // Serialize message field [SblockTimeStamp]
    bufferOffset = _serializer.string(obj.SblockTimeStamp, buffer, bufferOffset);
    // Serialize message field [SblockTrans]
    bufferOffset = _serializer.string(obj.SblockTrans, buffer, bufferOffset);
    // Serialize message field [SblockProductCode]
    bufferOffset = _serializer.string(obj.SblockProductCode, buffer, bufferOffset);
    // Serialize message field [SblockHash]
    bufferOffset = _serializer.string(obj.SblockHash, buffer, bufferOffset);
    // Serialize message field [SblockPreviousHash]
    bufferOffset = _serializer.string(obj.SblockPreviousHash, buffer, bufferOffset);
    // Serialize message field [SCarrierNumber]
    bufferOffset = _serializer.string(obj.SCarrierNumber, buffer, bufferOffset);
    // Serialize message field [firstIndex]
    bufferOffset = _serializer.int64(obj.firstIndex, buffer, bufferOffset);
    // Serialize message field [secondIndex]
    bufferOffset = _serializer.int64(obj.secondIndex, buffer, bufferOffset);
    // Serialize message field [thirdIndex]
    bufferOffset = _serializer.int64(obj.thirdIndex, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rewriteNode
    let len;
    let data = new rewriteNode(null);
    // Deserialize message field [SblockTimeStamp]
    data.SblockTimeStamp = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [SblockTrans]
    data.SblockTrans = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [SblockProductCode]
    data.SblockProductCode = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [SblockHash]
    data.SblockHash = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [SblockPreviousHash]
    data.SblockPreviousHash = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [SCarrierNumber]
    data.SCarrierNumber = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [firstIndex]
    data.firstIndex = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [secondIndex]
    data.secondIndex = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [thirdIndex]
    data.thirdIndex = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.SblockTimeStamp.length;
    length += object.SblockTrans.length;
    length += object.SblockProductCode.length;
    length += object.SblockHash.length;
    length += object.SblockPreviousHash.length;
    length += object.SCarrierNumber.length;
    return length + 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'blockChainPack_/rewriteNode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '91768e2469f9ae2ab2c7ec958edadd76';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string SblockTimeStamp
    string SblockTrans
    string SblockProductCode
    string SblockHash
    string SblockPreviousHash
    string SCarrierNumber
    
    int64 firstIndex
    int64 secondIndex
    int64 thirdIndex
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new rewriteNode(null);
    if (msg.SblockTimeStamp !== undefined) {
      resolved.SblockTimeStamp = msg.SblockTimeStamp;
    }
    else {
      resolved.SblockTimeStamp = ''
    }

    if (msg.SblockTrans !== undefined) {
      resolved.SblockTrans = msg.SblockTrans;
    }
    else {
      resolved.SblockTrans = ''
    }

    if (msg.SblockProductCode !== undefined) {
      resolved.SblockProductCode = msg.SblockProductCode;
    }
    else {
      resolved.SblockProductCode = ''
    }

    if (msg.SblockHash !== undefined) {
      resolved.SblockHash = msg.SblockHash;
    }
    else {
      resolved.SblockHash = ''
    }

    if (msg.SblockPreviousHash !== undefined) {
      resolved.SblockPreviousHash = msg.SblockPreviousHash;
    }
    else {
      resolved.SblockPreviousHash = ''
    }

    if (msg.SCarrierNumber !== undefined) {
      resolved.SCarrierNumber = msg.SCarrierNumber;
    }
    else {
      resolved.SCarrierNumber = ''
    }

    if (msg.firstIndex !== undefined) {
      resolved.firstIndex = msg.firstIndex;
    }
    else {
      resolved.firstIndex = 0
    }

    if (msg.secondIndex !== undefined) {
      resolved.secondIndex = msg.secondIndex;
    }
    else {
      resolved.secondIndex = 0
    }

    if (msg.thirdIndex !== undefined) {
      resolved.thirdIndex = msg.thirdIndex;
    }
    else {
      resolved.thirdIndex = 0
    }

    return resolved;
    }
};

module.exports = rewriteNode;
