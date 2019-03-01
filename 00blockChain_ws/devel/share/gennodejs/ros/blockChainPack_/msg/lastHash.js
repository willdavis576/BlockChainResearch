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

class lastHash {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.nodeName = null;
      this.productNumber = null;
      this.hash = null;
    }
    else {
      if (initObj.hasOwnProperty('nodeName')) {
        this.nodeName = initObj.nodeName
      }
      else {
        this.nodeName = '';
      }
      if (initObj.hasOwnProperty('productNumber')) {
        this.productNumber = initObj.productNumber
      }
      else {
        this.productNumber = 0;
      }
      if (initObj.hasOwnProperty('hash')) {
        this.hash = initObj.hash
      }
      else {
        this.hash = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type lastHash
    // Serialize message field [nodeName]
    bufferOffset = _serializer.string(obj.nodeName, buffer, bufferOffset);
    // Serialize message field [productNumber]
    bufferOffset = _serializer.int64(obj.productNumber, buffer, bufferOffset);
    // Serialize message field [hash]
    bufferOffset = _serializer.string(obj.hash, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type lastHash
    let len;
    let data = new lastHash(null);
    // Deserialize message field [nodeName]
    data.nodeName = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [productNumber]
    data.productNumber = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [hash]
    data.hash = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.nodeName.length;
    length += object.hash.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'blockChainPack_/lastHash';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8083626d8f7b25c3a89f2539b4ea325f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string nodeName
    int64 productNumber
    string hash
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new lastHash(null);
    if (msg.nodeName !== undefined) {
      resolved.nodeName = msg.nodeName;
    }
    else {
      resolved.nodeName = ''
    }

    if (msg.productNumber !== undefined) {
      resolved.productNumber = msg.productNumber;
    }
    else {
      resolved.productNumber = 0
    }

    if (msg.hash !== undefined) {
      resolved.hash = msg.hash;
    }
    else {
      resolved.hash = ''
    }

    return resolved;
    }
};

module.exports = lastHash;