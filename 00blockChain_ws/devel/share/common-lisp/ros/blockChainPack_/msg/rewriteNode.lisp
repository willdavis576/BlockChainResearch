; Auto-generated. Do not edit!


(cl:in-package blockChainPack_-msg)


;//! \htmlinclude rewriteNode.msg.html

(cl:defclass <rewriteNode> (roslisp-msg-protocol:ros-message)
  ((SblockTimeStamp
    :reader SblockTimeStamp
    :initarg :SblockTimeStamp
    :type cl:string
    :initform "")
   (SblockTrans
    :reader SblockTrans
    :initarg :SblockTrans
    :type cl:string
    :initform "")
   (SblockProductCode
    :reader SblockProductCode
    :initarg :SblockProductCode
    :type cl:integer
    :initform 0)
   (SblockHash
    :reader SblockHash
    :initarg :SblockHash
    :type cl:string
    :initform "")
   (SblockPreviousHash
    :reader SblockPreviousHash
    :initarg :SblockPreviousHash
    :type cl:string
    :initform "")
   (SCarrierNumber
    :reader SCarrierNumber
    :initarg :SCarrierNumber
    :type cl:integer
    :initform 0)
   (firstIndex
    :reader firstIndex
    :initarg :firstIndex
    :type cl:integer
    :initform 0)
   (secondIndex
    :reader secondIndex
    :initarg :secondIndex
    :type cl:integer
    :initform 0)
   (thirdIndex
    :reader thirdIndex
    :initarg :thirdIndex
    :type cl:integer
    :initform 0))
)

(cl:defclass rewriteNode (<rewriteNode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rewriteNode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rewriteNode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name blockChainPack_-msg:<rewriteNode> is deprecated: use blockChainPack_-msg:rewriteNode instead.")))

(cl:ensure-generic-function 'SblockTimeStamp-val :lambda-list '(m))
(cl:defmethod SblockTimeStamp-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:SblockTimeStamp-val is deprecated.  Use blockChainPack_-msg:SblockTimeStamp instead.")
  (SblockTimeStamp m))

(cl:ensure-generic-function 'SblockTrans-val :lambda-list '(m))
(cl:defmethod SblockTrans-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:SblockTrans-val is deprecated.  Use blockChainPack_-msg:SblockTrans instead.")
  (SblockTrans m))

(cl:ensure-generic-function 'SblockProductCode-val :lambda-list '(m))
(cl:defmethod SblockProductCode-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:SblockProductCode-val is deprecated.  Use blockChainPack_-msg:SblockProductCode instead.")
  (SblockProductCode m))

(cl:ensure-generic-function 'SblockHash-val :lambda-list '(m))
(cl:defmethod SblockHash-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:SblockHash-val is deprecated.  Use blockChainPack_-msg:SblockHash instead.")
  (SblockHash m))

(cl:ensure-generic-function 'SblockPreviousHash-val :lambda-list '(m))
(cl:defmethod SblockPreviousHash-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:SblockPreviousHash-val is deprecated.  Use blockChainPack_-msg:SblockPreviousHash instead.")
  (SblockPreviousHash m))

(cl:ensure-generic-function 'SCarrierNumber-val :lambda-list '(m))
(cl:defmethod SCarrierNumber-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:SCarrierNumber-val is deprecated.  Use blockChainPack_-msg:SCarrierNumber instead.")
  (SCarrierNumber m))

(cl:ensure-generic-function 'firstIndex-val :lambda-list '(m))
(cl:defmethod firstIndex-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:firstIndex-val is deprecated.  Use blockChainPack_-msg:firstIndex instead.")
  (firstIndex m))

(cl:ensure-generic-function 'secondIndex-val :lambda-list '(m))
(cl:defmethod secondIndex-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:secondIndex-val is deprecated.  Use blockChainPack_-msg:secondIndex instead.")
  (secondIndex m))

(cl:ensure-generic-function 'thirdIndex-val :lambda-list '(m))
(cl:defmethod thirdIndex-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:thirdIndex-val is deprecated.  Use blockChainPack_-msg:thirdIndex instead.")
  (thirdIndex m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rewriteNode>) ostream)
  "Serializes a message object of type '<rewriteNode>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'SblockTimeStamp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'SblockTimeStamp))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'SblockTrans))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'SblockTrans))
  (cl:let* ((signed (cl:slot-value msg 'SblockProductCode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'SblockHash))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'SblockHash))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'SblockPreviousHash))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'SblockPreviousHash))
  (cl:let* ((signed (cl:slot-value msg 'SCarrierNumber)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'firstIndex)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'secondIndex)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'thirdIndex)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rewriteNode>) istream)
  "Deserializes a message object of type '<rewriteNode>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'SblockTimeStamp) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'SblockTimeStamp) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'SblockTrans) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'SblockTrans) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'SblockProductCode) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'SblockHash) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'SblockHash) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'SblockPreviousHash) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'SblockPreviousHash) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'SCarrierNumber) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'firstIndex) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'secondIndex) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'thirdIndex) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rewriteNode>)))
  "Returns string type for a message object of type '<rewriteNode>"
  "blockChainPack_/rewriteNode")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rewriteNode)))
  "Returns string type for a message object of type 'rewriteNode"
  "blockChainPack_/rewriteNode")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rewriteNode>)))
  "Returns md5sum for a message object of type '<rewriteNode>"
  "b722726d77ee12b8172165f1aabcd67c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rewriteNode)))
  "Returns md5sum for a message object of type 'rewriteNode"
  "b722726d77ee12b8172165f1aabcd67c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rewriteNode>)))
  "Returns full string definition for message of type '<rewriteNode>"
  (cl:format cl:nil "string SblockTimeStamp~%string SblockTrans~%int64 SblockProductCode~%string SblockHash~%string SblockPreviousHash~%int64 SCarrierNumber~%~%int64 firstIndex~%int64 secondIndex~%int64 thirdIndex~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rewriteNode)))
  "Returns full string definition for message of type 'rewriteNode"
  (cl:format cl:nil "string SblockTimeStamp~%string SblockTrans~%int64 SblockProductCode~%string SblockHash~%string SblockPreviousHash~%int64 SCarrierNumber~%~%int64 firstIndex~%int64 secondIndex~%int64 thirdIndex~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rewriteNode>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'SblockTimeStamp))
     4 (cl:length (cl:slot-value msg 'SblockTrans))
     8
     4 (cl:length (cl:slot-value msg 'SblockHash))
     4 (cl:length (cl:slot-value msg 'SblockPreviousHash))
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rewriteNode>))
  "Converts a ROS message object to a list"
  (cl:list 'rewriteNode
    (cl:cons ':SblockTimeStamp (SblockTimeStamp msg))
    (cl:cons ':SblockTrans (SblockTrans msg))
    (cl:cons ':SblockProductCode (SblockProductCode msg))
    (cl:cons ':SblockHash (SblockHash msg))
    (cl:cons ':SblockPreviousHash (SblockPreviousHash msg))
    (cl:cons ':SCarrierNumber (SCarrierNumber msg))
    (cl:cons ':firstIndex (firstIndex msg))
    (cl:cons ':secondIndex (secondIndex msg))
    (cl:cons ':thirdIndex (thirdIndex msg))
))
