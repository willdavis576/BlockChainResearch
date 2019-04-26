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

class finish {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.compFiles = null;
    }
    else {
      if (initObj.hasOwnProperty('compFiles')) {
        this.compFiles = initObj.compFiles
      }
      else {
        this.compFiles = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type finish
    // Serialize message field [compFiles]
    bufferOffset = _serializer.int64(obj.compFiles, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type finish
    let len;
    let data = new finish(null);
    // Deserialize message field [compFiles]
    data.compFiles = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'blockChainPack_/finish';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '32144edba68833e7b59cc9286ebcccc6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 compFiles
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new finish(null);
    if (msg.compFiles !== undefined) {
      resolved.compFiles = msg.compFiles;
    }
    else {
      resolved.compFiles = 0
    }

    return resolved;
    }
};

module.exports = finish;
