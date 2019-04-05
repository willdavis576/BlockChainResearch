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
    :type cl:string
    :initform "")
   (SCarrierNumber
    :reader SCarrierNumber
    :initarg :SCarrierNumber
    :type cl:string
    :initform ""))
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

(cl:ensure-generic-function 'SCarrierNumber-val :lambda-list '(m))
(cl:defmethod SCarrierNumber-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:SCarrierNumber-val is deprecated.  Use blockChainPack_-msg:SCarrierNumber instead.")
  (SCarrierNumber m))
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
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'SblockProductCode))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'SblockProductCode))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'SCarrierNumber))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'SCarrierNumber))
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
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'SblockProductCode) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'SblockProductCode) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'SCarrierNumber) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'SCarrierNumber) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
  "7efbc7ca051609e91b5eb44f1e5cdf10")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rewriteNode)))
  "Returns md5sum for a message object of type 'rewriteNode"
  "7efbc7ca051609e91b5eb44f1e5cdf10")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rewriteNode>)))
  "Returns full string definition for message of type '<rewriteNode>"
  (cl:format cl:nil "string SblockTimeStamp~%string SblockTrans~%string SblockProductCode~%string SCarrierNumber~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rewriteNode)))
  "Returns full string definition for message of type 'rewriteNode"
  (cl:format cl:nil "string SblockTimeStamp~%string SblockTrans~%string SblockProductCode~%string SCarrierNumber~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rewriteNode>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'SblockTimeStamp))
     4 (cl:length (cl:slot-value msg 'SblockTrans))
     4 (cl:length (cl:slot-value msg 'SblockProductCode))
     4 (cl:length (cl:slot-value msg 'SCarrierNumber))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rewriteNode>))
  "Converts a ROS message object to a list"
  (cl:list 'rewriteNode
    (cl:cons ':SblockTimeStamp (SblockTimeStamp msg))
    (cl:cons ':SblockTrans (SblockTrans msg))
    (cl:cons ':SblockProductCode (SblockProductCode msg))
    (cl:cons ':SCarrierNumber (SCarrierNumber msg))
))
