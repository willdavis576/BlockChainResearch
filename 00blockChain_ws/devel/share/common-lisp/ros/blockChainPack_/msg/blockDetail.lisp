; Auto-generated. Do not edit!


(cl:in-package blockChainPack_-msg)


;//! \htmlinclude blockDetail.msg.html

(cl:defclass <blockDetail> (roslisp-msg-protocol:ros-message)
  ((blockNumber
    :reader blockNumber
    :initarg :blockNumber
    :type cl:integer
    :initform 0)
   (orderNumber
    :reader orderNumber
    :initarg :orderNumber
    :type cl:integer
    :initform 0)
   (carrierID
    :reader carrierID
    :initarg :carrierID
    :type cl:integer
    :initform 0)
   (timeStamp
    :reader timeStamp
    :initarg :timeStamp
    :type cl:string
    :initform "")
   (station
    :reader station
    :initarg :station
    :type cl:string
    :initform "")
   (productCode
    :reader productCode
    :initarg :productCode
    :type cl:integer
    :initform 0)
   (blockHash
    :reader blockHash
    :initarg :blockHash
    :type cl:string
    :initform "")
   (previousHash
    :reader previousHash
    :initarg :previousHash
    :type cl:string
    :initform ""))
)

(cl:defclass blockDetail (<blockDetail>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <blockDetail>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'blockDetail)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name blockChainPack_-msg:<blockDetail> is deprecated: use blockChainPack_-msg:blockDetail instead.")))

(cl:ensure-generic-function 'blockNumber-val :lambda-list '(m))
(cl:defmethod blockNumber-val ((m <blockDetail>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:blockNumber-val is deprecated.  Use blockChainPack_-msg:blockNumber instead.")
  (blockNumber m))

(cl:ensure-generic-function 'orderNumber-val :lambda-list '(m))
(cl:defmethod orderNumber-val ((m <blockDetail>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:orderNumber-val is deprecated.  Use blockChainPack_-msg:orderNumber instead.")
  (orderNumber m))

(cl:ensure-generic-function 'carrierID-val :lambda-list '(m))
(cl:defmethod carrierID-val ((m <blockDetail>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:carrierID-val is deprecated.  Use blockChainPack_-msg:carrierID instead.")
  (carrierID m))

(cl:ensure-generic-function 'timeStamp-val :lambda-list '(m))
(cl:defmethod timeStamp-val ((m <blockDetail>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:timeStamp-val is deprecated.  Use blockChainPack_-msg:timeStamp instead.")
  (timeStamp m))

(cl:ensure-generic-function 'station-val :lambda-list '(m))
(cl:defmethod station-val ((m <blockDetail>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:station-val is deprecated.  Use blockChainPack_-msg:station instead.")
  (station m))

(cl:ensure-generic-function 'productCode-val :lambda-list '(m))
(cl:defmethod productCode-val ((m <blockDetail>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:productCode-val is deprecated.  Use blockChainPack_-msg:productCode instead.")
  (productCode m))

(cl:ensure-generic-function 'blockHash-val :lambda-list '(m))
(cl:defmethod blockHash-val ((m <blockDetail>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:blockHash-val is deprecated.  Use blockChainPack_-msg:blockHash instead.")
  (blockHash m))

(cl:ensure-generic-function 'previousHash-val :lambda-list '(m))
(cl:defmethod previousHash-val ((m <blockDetail>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:previousHash-val is deprecated.  Use blockChainPack_-msg:previousHash instead.")
  (previousHash m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <blockDetail>) ostream)
  "Serializes a message object of type '<blockDetail>"
  (cl:let* ((signed (cl:slot-value msg 'blockNumber)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'orderNumber)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'carrierID)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'timeStamp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'timeStamp))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'station))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'station))
  (cl:let* ((signed (cl:slot-value msg 'productCode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'blockHash))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'blockHash))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'previousHash))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'previousHash))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <blockDetail>) istream)
  "Deserializes a message object of type '<blockDetail>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'blockNumber) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'orderNumber) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'carrierID) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timeStamp) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'timeStamp) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'station) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'station) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'productCode) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'blockHash) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'blockHash) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'previousHash) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'previousHash) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<blockDetail>)))
  "Returns string type for a message object of type '<blockDetail>"
  "blockChainPack_/blockDetail")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'blockDetail)))
  "Returns string type for a message object of type 'blockDetail"
  "blockChainPack_/blockDetail")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<blockDetail>)))
  "Returns md5sum for a message object of type '<blockDetail>"
  "5091a84f3e39f87dbd6a52f50fce01bf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'blockDetail)))
  "Returns md5sum for a message object of type 'blockDetail"
  "5091a84f3e39f87dbd6a52f50fce01bf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<blockDetail>)))
  "Returns full string definition for message of type '<blockDetail>"
  (cl:format cl:nil "int64 blockNumber~%int64 orderNumber~%int64 carrierID~%string timeStamp~%string station~%int64 productCode~%string blockHash~%string previousHash~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'blockDetail)))
  "Returns full string definition for message of type 'blockDetail"
  (cl:format cl:nil "int64 blockNumber~%int64 orderNumber~%int64 carrierID~%string timeStamp~%string station~%int64 productCode~%string blockHash~%string previousHash~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <blockDetail>))
  (cl:+ 0
     8
     8
     8
     4 (cl:length (cl:slot-value msg 'timeStamp))
     4 (cl:length (cl:slot-value msg 'station))
     8
     4 (cl:length (cl:slot-value msg 'blockHash))
     4 (cl:length (cl:slot-value msg 'previousHash))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <blockDetail>))
  "Converts a ROS message object to a list"
  (cl:list 'blockDetail
    (cl:cons ':blockNumber (blockNumber msg))
    (cl:cons ':orderNumber (orderNumber msg))
    (cl:cons ':carrierID (carrierID msg))
    (cl:cons ':timeStamp (timeStamp msg))
    (cl:cons ':station (station msg))
    (cl:cons ':productCode (productCode msg))
    (cl:cons ':blockHash (blockHash msg))
    (cl:cons ':previousHash (previousHash msg))
))
