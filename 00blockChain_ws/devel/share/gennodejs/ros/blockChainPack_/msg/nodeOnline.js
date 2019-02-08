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

class nodeOnline {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.nodeName = null;
    }
    else {
      if (initObj.hasOwnProperty('nodeName')) {
        this.nodeName = initObj.nodeName
      }
      else {
        this.nodeName = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type nodeOnline
    // Serialize message field [nodeName]
    bufferOffset = _serializer.string(obj.nodeName, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type nodeOnline
    let len;
    let data = new nodeOnline(null);
    // Deserialize message field [nodeName]
    data.nodeName = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.nodeName.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'blockChainPack_/nodeOnline';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fa90f177c62ffd4f5a57999c98f4104f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string nodeName
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new nodeOnline(null);
    if (msg.nodeName !== undefined) {
      resolved.nodeName = msg.nodeName;
    }
    else {
      resolved.nodeName = ''
    }

    return resolved;
    }
};

module.exports = nodeOnline;
