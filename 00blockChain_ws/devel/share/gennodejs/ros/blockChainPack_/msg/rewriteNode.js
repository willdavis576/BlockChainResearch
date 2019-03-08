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
      this.left = null;
      this.right = null;
      this.element = null;
    }
    else {
      if (initObj.hasOwnProperty('left')) {
        this.left = initObj.left
      }
      else {
        this.left = 0;
      }
      if (initObj.hasOwnProperty('right')) {
        this.right = initObj.right
      }
      else {
        this.right = 0;
      }
      if (initObj.hasOwnProperty('element')) {
        this.element = initObj.element
      }
      else {
        this.element = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rewriteNode
    // Serialize message field [left]
    bufferOffset = _serializer.int32(obj.left, buffer, bufferOffset);
    // Serialize message field [right]
    bufferOffset = _serializer.int32(obj.right, buffer, bufferOffset);
    // Serialize message field [element]
    bufferOffset = _serializer.string(obj.element, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rewriteNode
    let len;
    let data = new rewriteNode(null);
    // Deserialize message field [left]
    data.left = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [right]
    data.right = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [element]
    data.element = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.element.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'blockChainPack_/rewriteNode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'de7b9a4f559650249dc7ff7249ac243f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 left
    int32 right
    string element
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new rewriteNode(null);
    if (msg.left !== undefined) {
      resolved.left = msg.left;
    }
    else {
      resolved.left = 0
    }

    if (msg.right !== undefined) {
      resolved.right = msg.right;
    }
    else {
      resolved.right = 0
    }

    if (msg.element !== undefined) {
      resolved.element = msg.element;
    }
    else {
      resolved.element = ''
    }

    return resolved;
    }
};

module.exports = rewriteNode;
