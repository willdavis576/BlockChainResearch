; Auto-generated. Do not edit!


(cl:in-package blockChainPack_-msg)


;//! \htmlinclude rewriteNode.msg.html

(cl:defclass <rewriteNode> (roslisp-msg-protocol:ros-message)
  ((left
    :reader left
    :initarg :left
    :type cl:integer
    :initform 0)
   (right
    :reader right
    :initarg :right
    :type cl:integer
    :initform 0)
   (element
    :reader element
    :initarg :element
    :type cl:string
    :initform ""))
)

(cl:defclass rewriteNode (<rewriteNode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rewriteNode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rewriteNode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name blockChainPack_-msg:<rewriteNode> is deprecated: use blockChainPack_-msg:rewriteNode instead.")))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:left-val is deprecated.  Use blockChainPack_-msg:left instead.")
  (left m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:right-val is deprecated.  Use blockChainPack_-msg:right instead.")
  (right m))

(cl:ensure-generic-function 'element-val :lambda-list '(m))
(cl:defmethod element-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:element-val is deprecated.  Use blockChainPack_-msg:element instead.")
  (element m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rewriteNode>) ostream)
  "Serializes a message object of type '<rewriteNode>"
  (cl:let* ((signed (cl:slot-value msg 'left)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'element))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'element))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rewriteNode>) istream)
  "Deserializes a message object of type '<rewriteNode>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'element) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'element) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
  "de7b9a4f559650249dc7ff7249ac243f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rewriteNode)))
  "Returns md5sum for a message object of type 'rewriteNode"
  "de7b9a4f559650249dc7ff7249ac243f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rewriteNode>)))
  "Returns full string definition for message of type '<rewriteNode>"
  (cl:format cl:nil "int32 left~%int32 right~%string element~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rewriteNode)))
  "Returns full string definition for message of type 'rewriteNode"
  (cl:format cl:nil "int32 left~%int32 right~%string element~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rewriteNode>))
  (cl:+ 0
     4
     4
     4 (cl:length (cl:slot-value msg 'element))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rewriteNode>))
  "Converts a ROS message object to a list"
  (cl:list 'rewriteNode
    (cl:cons ':left (left msg))
    (cl:cons ':right (right msg))
    (cl:cons ':element (element msg))
))
