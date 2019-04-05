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
      this.SCarrierNumber = null;
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
      if (initObj.hasOwnProperty('SCarrierNumber')) {
        this.SCarrierNumber = initObj.SCarrierNumber
      }
      else {
        this.SCarrierNumber = '';
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
    // Serialize message field [SCarrierNumber]
    bufferOffset = _serializer.string(obj.SCarrierNumber, buffer, bufferOffset);
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
    // Deserialize message field [SCarrierNumber]
    data.SCarrierNumber = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.SblockTimeStamp.length;
    length += object.SblockTrans.length;
    length += object.SblockProductCode.length;
    length += object.SCarrierNumber.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'blockChainPack_/rewriteNode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7efbc7ca051609e91b5eb44f1e5cdf10';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string SblockTimeStamp
    string SblockTrans
    string SblockProductCode
    string SCarrierNumber
    
    
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

    if (msg.SCarrierNumber !== undefined) {
      resolved.SCarrierNumber = msg.SCarrierNumber;
    }
    else {
      resolved.SCarrierNumber = ''
    }

    return resolved;
    }
};

module.exports = rewriteNode;
