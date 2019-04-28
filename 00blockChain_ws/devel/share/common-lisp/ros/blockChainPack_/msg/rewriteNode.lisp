; Auto-generated. Do not edit!


(cl:in-package blockChainPack_-msg)


;//! \htmlinclude rewriteNode.msg.html

(cl:defclass <rewriteNode> (roslisp-msg-protocol:ros-message)
  ((arrayTransfer
    :reader arrayTransfer
    :initarg :arrayTransfer
    :type cl:string
    :initform "")
   (fileOrArray
    :reader fileOrArray
    :initarg :fileOrArray
    :type cl:string
    :initform ""))
)

(cl:defclass rewriteNode (<rewriteNode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rewriteNode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rewriteNode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name blockChainPack_-msg:<rewriteNode> is deprecated: use blockChainPack_-msg:rewriteNode instead.")))

(cl:ensure-generic-function 'arrayTransfer-val :lambda-list '(m))
(cl:defmethod arrayTransfer-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:arrayTransfer-val is deprecated.  Use blockChainPack_-msg:arrayTransfer instead.")
  (arrayTransfer m))

(cl:ensure-generic-function 'fileOrArray-val :lambda-list '(m))
(cl:defmethod fileOrArray-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:fileOrArray-val is deprecated.  Use blockChainPack_-msg:fileOrArray instead.")
  (fileOrArray m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rewriteNode>) ostream)
  "Serializes a message object of type '<rewriteNode>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'arrayTransfer))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'arrayTransfer))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'fileOrArray))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'fileOrArray))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rewriteNode>) istream)
  "Deserializes a message object of type '<rewriteNode>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'arrayTransfer) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'arrayTransfer) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fileOrArray) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'fileOrArray) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
  "50ee5140b974cb540cb9a0539068bb23")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rewriteNode)))
  "Returns md5sum for a message object of type 'rewriteNode"
  "50ee5140b974cb540cb9a0539068bb23")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rewriteNode>)))
  "Returns full string definition for message of type '<rewriteNode>"
  (cl:format cl:nil "string arrayTransfer~%string fileOrArray~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rewriteNode)))
  "Returns full string definition for message of type 'rewriteNode"
  (cl:format cl:nil "string arrayTransfer~%string fileOrArray~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rewriteNode>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'arrayTransfer))
     4 (cl:length (cl:slot-value msg 'fileOrArray))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rewriteNode>))
  "Converts a ROS message object to a list"
  (cl:list 'rewriteNode
    (cl:cons ':arrayTransfer (arrayTransfer msg))
    (cl:cons ':fileOrArray (fileOrArray msg))
))
