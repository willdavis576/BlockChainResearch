; Auto-generated. Do not edit!


(cl:in-package blockChainPack_-msg)


;//! \htmlinclude blockDetail.msg.html

(cl:defclass <blockDetail> (roslisp-msg-protocol:ros-message)
  ((blockNumber
    :reader blockNumber
    :initarg :blockNumber
    :type cl:integer
    :initform 0)
   (productNumber
    :reader productNumber
    :initarg :productNumber
    :type cl:integer
    :initform 0)
   (timeStamp
    :reader timeStamp
    :initarg :timeStamp
    :type cl:string
    :initform "")
   (transactions
    :reader transactions
    :initarg :transactions
    :type cl:string
    :initform "")
   (serialNumber
    :reader serialNumber
    :initarg :serialNumber
    :type cl:string
    :initform "")
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

(cl:ensure-generic-function 'productNumber-val :lambda-list '(m))
(cl:defmethod productNumber-val ((m <blockDetail>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:productNumber-val is deprecated.  Use blockChainPack_-msg:productNumber instead.")
  (productNumber m))

(cl:ensure-generic-function 'timeStamp-val :lambda-list '(m))
(cl:defmethod timeStamp-val ((m <blockDetail>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:timeStamp-val is deprecated.  Use blockChainPack_-msg:timeStamp instead.")
  (timeStamp m))

(cl:ensure-generic-function 'transactions-val :lambda-list '(m))
(cl:defmethod transactions-val ((m <blockDetail>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:transactions-val is deprecated.  Use blockChainPack_-msg:transactions instead.")
  (transactions m))

(cl:ensure-generic-function 'serialNumber-val :lambda-list '(m))
(cl:defmethod serialNumber-val ((m <blockDetail>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:serialNumber-val is deprecated.  Use blockChainPack_-msg:serialNumber instead.")
  (serialNumber m))

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
  (cl:let* ((signed (cl:slot-value msg 'productNumber)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'transactions))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'transactions))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'serialNumber))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'serialNumber))
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
      (cl:setf (cl:slot-value msg 'productNumber) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
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
      (cl:setf (cl:slot-value msg 'transactions) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'transactions) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'serialNumber) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'serialNumber) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
  "392845d38e7dbd0b3e34f5d6ba02ccf6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'blockDetail)))
  "Returns md5sum for a message object of type 'blockDetail"
  "392845d38e7dbd0b3e34f5d6ba02ccf6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<blockDetail>)))
  "Returns full string definition for message of type '<blockDetail>"
  (cl:format cl:nil "int64 blockNumber~%int64 productNumber~%string timeStamp~%string transactions~%string serialNumber~%string blockHash~%string previousHash~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'blockDetail)))
  "Returns full string definition for message of type 'blockDetail"
  (cl:format cl:nil "int64 blockNumber~%int64 productNumber~%string timeStamp~%string transactions~%string serialNumber~%string blockHash~%string previousHash~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <blockDetail>))
  (cl:+ 0
     8
     8
     4 (cl:length (cl:slot-value msg 'timeStamp))
     4 (cl:length (cl:slot-value msg 'transactions))
     4 (cl:length (cl:slot-value msg 'serialNumber))
     4 (cl:length (cl:slot-value msg 'blockHash))
     4 (cl:length (cl:slot-value msg 'previousHash))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <blockDetail>))
  "Converts a ROS message object to a list"
  (cl:list 'blockDetail
    (cl:cons ':blockNumber (blockNumber msg))
    (cl:cons ':productNumber (productNumber msg))
    (cl:cons ':timeStamp (timeStamp msg))
    (cl:cons ':transactions (transactions msg))
    (cl:cons ':serialNumber (serialNumber msg))
    (cl:cons ':blockHash (blockHash msg))
    (cl:cons ':previousHash (previousHash msg))
))
