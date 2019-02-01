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
      this.timeStamp = null;
      this.transactions = null;
      this.serialNumber = null;
      this.blockHash = null;
      this.previousHash = null;
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
      if (initObj.hasOwnProperty('timeStamp')) {
        this.timeStamp = initObj.timeStamp
      }
      else {
        this.timeStamp = '';
      }
      if (initObj.hasOwnProperty('transactions')) {
        this.transactions = initObj.transactions
      }
      else {
        this.transactions = '';
      }
      if (initObj.hasOwnProperty('serialNumber')) {
        this.serialNumber = initObj.serialNumber
      }
      else {
        this.serialNumber = '';
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type blockDetail
    // Serialize message field [blockNumber]
    bufferOffset = _serializer.int64(obj.blockNumber, buffer, bufferOffset);
    // Serialize message field [productNumber]
    bufferOffset = _serializer.int64(obj.productNumber, buffer, bufferOffset);
    // Serialize message field [timeStamp]
    bufferOffset = _serializer.string(obj.timeStamp, buffer, bufferOffset);
    // Serialize message field [transactions]
    bufferOffset = _serializer.string(obj.transactions, buffer, bufferOffset);
    // Serialize message field [serialNumber]
    bufferOffset = _serializer.string(obj.serialNumber, buffer, bufferOffset);
    // Serialize message field [blockHash]
    bufferOffset = _serializer.string(obj.blockHash, buffer, bufferOffset);
    // Serialize message field [previousHash]
    bufferOffset = _serializer.string(obj.previousHash, buffer, bufferOffset);
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
    // Deserialize message field [timeStamp]
    data.timeStamp = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [transactions]
    data.transactions = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [serialNumber]
    data.serialNumber = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [blockHash]
    data.blockHash = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [previousHash]
    data.previousHash = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.timeStamp.length;
    length += object.transactions.length;
    length += object.serialNumber.length;
    length += object.blockHash.length;
    length += object.previousHash.length;
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'blockChainPack_/blockDetail';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '392845d38e7dbd0b3e34f5d6ba02ccf6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 blockNumber
    int64 productNumber
    string timeStamp
    string transactions
    string serialNumber
    string blockHash
    string previousHash
    
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

    if (msg.timeStamp !== undefined) {
      resolved.timeStamp = msg.timeStamp;
    }
    else {
      resolved.timeStamp = ''
    }

    if (msg.transactions !== undefined) {
      resolved.transactions = msg.transactions;
    }
    else {
      resolved.transactions = ''
    }

    if (msg.serialNumber !== undefined) {
      resolved.serialNumber = msg.serialNumber;
    }
    else {
      resolved.serialNumber = ''
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

    return resolved;
    }
};

module.exports = blockDetail;
