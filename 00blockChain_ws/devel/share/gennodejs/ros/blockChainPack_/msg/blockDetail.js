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

class blockDetail {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.blockNumber = null;
      this.productNumber = null;
    }
    else {
      if (initObj.hasOwnProperty('blockNumber')) {
        this.blockNumber = initObj.blockNumber
      }
      else {
        this.blockNumber = 0;
      }
      if (initObj.hasOwnProperty('productNumber')) {
        this.productNumber = initObj.productNumber
      }
      else {
        this.productNumber = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type blockDetail
    // Serialize message field [blockNumber]
    bufferOffset = _serializer.int64(obj.blockNumber, buffer, bufferOffset);
    // Serialize message field [productNumber]
    bufferOffset = _serializer.int64(obj.productNumber, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type blockDetail
    let len;
    let data = new blockDetail(null);
    // Deserialize message field [blockNumber]
    data.blockNumber = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [productNumber]
    data.productNumber = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'blockChainPack_/blockDetail';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b27a6222581411b9d599cbf56966d81d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 blockNumber
    int64 productNumber
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new blockDetail(null);
    if (msg.blockNumber !== undefined) {
      resolved.blockNumber = msg.blockNumber;
    }
    else {
      resolved.blockNumber = 0
    }

    if (msg.productNumber !== undefined) {
      resolved.productNumber = msg.productNumber;
    }
    else {
      resolved.productNumber = 0
    }

    return resolved;
    }
};

module.exports = blockDetail;
