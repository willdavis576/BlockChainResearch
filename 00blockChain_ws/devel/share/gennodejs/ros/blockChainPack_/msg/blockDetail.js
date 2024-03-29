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
      this.orderNumber = null;
      this.carrierID = null;
      this.timeStamp = null;
      this.station = null;
      this.productCode = null;
      this.blockHash = null;
      this.previousHash = null;
      this.data1 = null;
      this.data2 = null;
    }
    else {
      if (initObj.hasOwnProperty('blockNumber')) {
        this.blockNumber = initObj.blockNumber
      }
      else {
        this.blockNumber = 0;
      }
      if (initObj.hasOwnProperty('orderNumber')) {
        this.orderNumber = initObj.orderNumber
      }
      else {
        this.orderNumber = 0;
      }
      if (initObj.hasOwnProperty('carrierID')) {
        this.carrierID = initObj.carrierID
      }
      else {
        this.carrierID = 0;
      }
      if (initObj.hasOwnProperty('timeStamp')) {
        this.timeStamp = initObj.timeStamp
      }
      else {
        this.timeStamp = '';
      }
      if (initObj.hasOwnProperty('station')) {
        this.station = initObj.station
      }
      else {
        this.station = '';
      }
      if (initObj.hasOwnProperty('productCode')) {
        this.productCode = initObj.productCode
      }
      else {
        this.productCode = 0;
      }
      if (initObj.hasOwnProperty('blockHash')) {
        this.blockHash = initObj.blockHash
      }
      else {
        this.blockHash = '';
      }
      if (initObj.hasOwnProperty('previousHash')) {
        this.previousHash = initObj.previousHash
      }
      else {
        this.previousHash = '';
      }
      if (initObj.hasOwnProperty('data1')) {
        this.data1 = initObj.data1
      }
      else {
        this.data1 = '';
      }
      if (initObj.hasOwnProperty('data2')) {
        this.data2 = initObj.data2
      }
      else {
        this.data2 = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type blockDetail
    // Serialize message field [blockNumber]
    bufferOffset = _serializer.int64(obj.blockNumber, buffer, bufferOffset);
    // Serialize message field [orderNumber]
    bufferOffset = _serializer.int64(obj.orderNumber, buffer, bufferOffset);
    // Serialize message field [carrierID]
    bufferOffset = _serializer.int64(obj.carrierID, buffer, bufferOffset);
    // Serialize message field [timeStamp]
    bufferOffset = _serializer.string(obj.timeStamp, buffer, bufferOffset);
    // Serialize message field [station]
    bufferOffset = _serializer.string(obj.station, buffer, bufferOffset);
    // Serialize message field [productCode]
    bufferOffset = _serializer.int64(obj.productCode, buffer, bufferOffset);
    // Serialize message field [blockHash]
    bufferOffset = _serializer.string(obj.blockHash, buffer, bufferOffset);
    // Serialize message field [previousHash]
    bufferOffset = _serializer.string(obj.previousHash, buffer, bufferOffset);
    // Serialize message field [data1]
    bufferOffset = _serializer.string(obj.data1, buffer, bufferOffset);
    // Serialize message field [data2]
    bufferOffset = _serializer.string(obj.data2, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type blockDetail
    let len;
    let data = new blockDetail(null);
    // Deserialize message field [blockNumber]
    data.blockNumber = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [orderNumber]
    data.orderNumber = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [carrierID]
    data.carrierID = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [timeStamp]
    data.timeStamp = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [station]
    data.station = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [productCode]
    data.productCode = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [blockHash]
    data.blockHash = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [previousHash]
    data.previousHash = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [data1]
    data.data1 = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [data2]
    data.data2 = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.timeStamp.length;
    length += object.station.length;
    length += object.blockHash.length;
    length += object.previousHash.length;
    length += object.data1.length;
    length += object.data2.length;
    return length + 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'blockChainPack_/blockDetail';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eec3600f5db19bf506449d3adb47adae';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 blockNumber
    int64 orderNumber
    int64 carrierID
    string timeStamp
    string station
    int64 productCode
    string blockHash
    string previousHash
    string data1
    string data2
    
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

    if (msg.orderNumber !== undefined) {
      resolved.orderNumber = msg.orderNumber;
    }
    else {
      resolved.orderNumber = 0
    }

    if (msg.carrierID !== undefined) {
      resolved.carrierID = msg.carrierID;
    }
    else {
      resolved.carrierID = 0
    }

    if (msg.timeStamp !== undefined) {
      resolved.timeStamp = msg.timeStamp;
    }
    else {
      resolved.timeStamp = ''
    }

    if (msg.station !== undefined) {
      resolved.station = msg.station;
    }
    else {
      resolved.station = ''
    }

    if (msg.productCode !== undefined) {
      resolved.productCode = msg.productCode;
    }
    else {
      resolved.productCode = 0
    }

    if (msg.blockHash !== undefined) {
      resolved.blockHash = msg.blockHash;
    }
    else {
      resolved.blockHash = ''
    }

    if (msg.previousHash !== undefined) {
      resolved.previousHash = msg.previousHash;
    }
    else {
      resolved.previousHash = ''
    }

    if (msg.data1 !== undefined) {
      resolved.data1 = msg.data1;
    }
    else {
      resolved.data1 = ''
    }

    if (msg.data2 !== undefined) {
      resolved.data2 = msg.data2;
    }
    else {
      resolved.data2 = ''
    }

    return resolved;
    }
};

module.exports = blockDetail;
