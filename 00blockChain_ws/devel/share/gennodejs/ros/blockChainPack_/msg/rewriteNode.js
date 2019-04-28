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
      this.arrayTransfer = null;
      this.fileOrArray = null;
    }
    else {
      if (initObj.hasOwnProperty('arrayTransfer')) {
        this.arrayTransfer = initObj.arrayTransfer
      }
      else {
        this.arrayTransfer = '';
      }
      if (initObj.hasOwnProperty('fileOrArray')) {
        this.fileOrArray = initObj.fileOrArray
      }
      else {
        this.fileOrArray = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rewriteNode
    // Serialize message field [arrayTransfer]
    bufferOffset = _serializer.string(obj.arrayTransfer, buffer, bufferOffset);
    // Serialize message field [fileOrArray]
    bufferOffset = _serializer.string(obj.fileOrArray, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rewriteNode
    let len;
    let data = new rewriteNode(null);
    // Deserialize message field [arrayTransfer]
    data.arrayTransfer = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [fileOrArray]
    data.fileOrArray = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.arrayTransfer.length;
    length += object.fileOrArray.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'blockChainPack_/rewriteNode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '50ee5140b974cb540cb9a0539068bb23';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string arrayTransfer
    string fileOrArray
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new rewriteNode(null);
    if (msg.arrayTransfer !== undefined) {
      resolved.arrayTransfer = msg.arrayTransfer;
    }
    else {
      resolved.arrayTransfer = ''
    }

    if (msg.fileOrArray !== undefined) {
      resolved.fileOrArray = msg.fileOrArray;
    }
    else {
      resolved.fileOrArray = ''
    }

    return resolved;
    }
};

module.exports = rewriteNode;
