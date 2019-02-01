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

class Test {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.testingMsg = null;
    }
    else {
      if (initObj.hasOwnProperty('testingMsg')) {
        this.testingMsg = initObj.testingMsg
      }
      else {
        this.testingMsg = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Test
    // Serialize message field [testingMsg]
    bufferOffset = _serializer.string(obj.testingMsg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Test
    let len;
    let data = new Test(null);
    // Deserialize message field [testingMsg]
    data.testingMsg = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.testingMsg.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'blockChainPack_/Test';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '78c90679f25a95e5f459c98217d5f15a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string testingMsg
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Test(null);
    if (msg.testingMsg !== undefined) {
      resolved.testingMsg = msg.testingMsg;
    }
    else {
      resolved.testingMsg = ''
    }

    return resolved;
    }
};

module.exports = Test;
