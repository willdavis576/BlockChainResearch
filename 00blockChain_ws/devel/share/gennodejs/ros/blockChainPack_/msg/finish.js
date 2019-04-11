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
      this.carrierID = null;
      this.order = null;
      this.counter = null;
    }
    else {
      if (initObj.hasOwnProperty('carrierID')) {
        this.carrierID = initObj.carrierID
      }
      else {
        this.carrierID = 0;
      }
      if (initObj.hasOwnProperty('order')) {
        this.order = initObj.order
      }
      else {
        this.order = 0;
      }
      if (initObj.hasOwnProperty('counter')) {
        this.counter = initObj.counter
      }
      else {
        this.counter = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type finish
    // Serialize message field [carrierID]
    bufferOffset = _serializer.int64(obj.carrierID, buffer, bufferOffset);
    // Serialize message field [order]
    bufferOffset = _serializer.int64(obj.order, buffer, bufferOffset);
    // Serialize message field [counter]
    bufferOffset = _serializer.int64(obj.counter, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type finish
    let len;
    let data = new finish(null);
    // Deserialize message field [carrierID]
    data.carrierID = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [order]
    data.order = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [counter]
    data.counter = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'blockChainPack_/finish';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1efba28662379f734d4ad8a51cd40130';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 carrierID
    int64 order
    int64 counter
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new finish(null);
    if (msg.carrierID !== undefined) {
      resolved.carrierID = msg.carrierID;
    }
    else {
      resolved.carrierID = 0
    }

    if (msg.order !== undefined) {
      resolved.order = msg.order;
    }
    else {
      resolved.order = 0
    }

    if (msg.counter !== undefined) {
      resolved.counter = msg.counter;
    }
    else {
      resolved.counter = 0
    }

    return resolved;
    }
};

module.exports = finish;
