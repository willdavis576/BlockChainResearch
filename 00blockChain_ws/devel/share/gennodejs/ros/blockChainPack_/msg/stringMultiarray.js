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

class stringMultiarray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.prodNum = null;
      this.blocks = null;
    }
    else {
      if (initObj.hasOwnProperty('prodNum')) {
        this.prodNum = initObj.prodNum
      }
      else {
        this.prodNum = 0;
      }
      if (initObj.hasOwnProperty('blocks')) {
        this.blocks = initObj.blocks
      }
      else {
        this.blocks = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type stringMultiarray
    // Serialize message field [prodNum]
    bufferOffset = _serializer.int32(obj.prodNum, buffer, bufferOffset);
    // Serialize message field [blocks]
    bufferOffset = _arraySerializer.string(obj.blocks, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type stringMultiarray
    let len;
    let data = new stringMultiarray(null);
    // Deserialize message field [prodNum]
    data.prodNum = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [blocks]
    data.blocks = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.blocks.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'blockChainPack_/stringMultiarray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'accb76f5450794af9ee3f3f81a5ea7c0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 prodNum
    string[] blocks
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new stringMultiarray(null);
    if (msg.prodNum !== undefined) {
      resolved.prodNum = msg.prodNum;
    }
    else {
      resolved.prodNum = 0
    }

    if (msg.blocks !== undefined) {
      resolved.blocks = msg.blocks;
    }
    else {
      resolved.blocks = []
    }

    return resolved;
    }
};

module.exports = stringMultiarray;
