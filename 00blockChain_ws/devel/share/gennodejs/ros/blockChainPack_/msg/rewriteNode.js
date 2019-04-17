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
      this.fileName = null;
      this.logFile = null;
      this.logHash = null;
      this.REcounter = null;
      this.done = null;
    }
    else {
      if (initObj.hasOwnProperty('arrayTransfer')) {
        this.arrayTransfer = initObj.arrayTransfer
      }
      else {
        this.arrayTransfer = '';
      }
      if (initObj.hasOwnProperty('fileName')) {
        this.fileName = initObj.fileName
      }
      else {
        this.fileName = '';
      }
      if (initObj.hasOwnProperty('logFile')) {
        this.logFile = initObj.logFile
      }
      else {
        this.logFile = '';
      }
      if (initObj.hasOwnProperty('logHash')) {
        this.logHash = initObj.logHash
      }
      else {
        this.logHash = '';
      }
      if (initObj.hasOwnProperty('REcounter')) {
        this.REcounter = initObj.REcounter
      }
      else {
        this.REcounter = 0;
      }
      if (initObj.hasOwnProperty('done')) {
        this.done = initObj.done
      }
      else {
        this.done = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rewriteNode
    // Serialize message field [arrayTransfer]
    bufferOffset = _serializer.string(obj.arrayTransfer, buffer, bufferOffset);
    // Serialize message field [fileName]
    bufferOffset = _serializer.string(obj.fileName, buffer, bufferOffset);
    // Serialize message field [logFile]
    bufferOffset = _serializer.string(obj.logFile, buffer, bufferOffset);
    // Serialize message field [logHash]
    bufferOffset = _serializer.string(obj.logHash, buffer, bufferOffset);
    // Serialize message field [REcounter]
    bufferOffset = _serializer.int64(obj.REcounter, buffer, bufferOffset);
    // Serialize message field [done]
    bufferOffset = _serializer.int64(obj.done, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rewriteNode
    let len;
    let data = new rewriteNode(null);
    // Deserialize message field [arrayTransfer]
    data.arrayTransfer = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [fileName]
    data.fileName = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [logFile]
    data.logFile = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [logHash]
    data.logHash = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [REcounter]
    data.REcounter = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [done]
    data.done = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.arrayTransfer.length;
    length += object.fileName.length;
    length += object.logFile.length;
    length += object.logHash.length;
    return length + 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'blockChainPack_/rewriteNode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ce6d37a12366ea5169180721d54de41b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string arrayTransfer
    string fileName
    string logFile
    string logHash
    int64 REcounter
    int64 done
    
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

    if (msg.fileName !== undefined) {
      resolved.fileName = msg.fileName;
    }
    else {
      resolved.fileName = ''
    }

    if (msg.logFile !== undefined) {
      resolved.logFile = msg.logFile;
    }
    else {
      resolved.logFile = ''
    }

    if (msg.logHash !== undefined) {
      resolved.logHash = msg.logHash;
    }
    else {
      resolved.logHash = ''
    }

    if (msg.REcounter !== undefined) {
      resolved.REcounter = msg.REcounter;
    }
    else {
      resolved.REcounter = 0
    }

    if (msg.done !== undefined) {
      resolved.done = msg.done;
    }
    else {
      resolved.done = 0
    }

    return resolved;
    }
};

module.exports = rewriteNode;
