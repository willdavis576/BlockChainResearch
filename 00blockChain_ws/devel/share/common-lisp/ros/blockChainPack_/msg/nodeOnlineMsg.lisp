; Auto-generated. Do not edit!


(cl:in-package blockChainPack_-msg)


;//! \htmlinclude nodeOnlineMsg.msg.html

(cl:defclass <nodeOnlineMsg> (roslisp-msg-protocol:ros-message)
  ((nodeName
    :reader nodeName
    :initarg :nodeName
    :type cl:string
    :initform ""))
)

(cl:defclass nodeOnlineMsg (<nodeOnlineMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <nodeOnlineMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'nodeOnlineMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name blockChainPack_-msg:<nodeOnlineMsg> is deprecated: use blockChainPack_-msg:nodeOnlineMsg instead.")))

(cl:ensure-generic-function 'nodeName-val :lambda-list '(m))
(cl:defmethod nodeName-val ((m <nodeOnlineMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:nodeName-val is deprecated.  Use blockChainPack_-msg:nodeName instead.")
  (nodeName m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <nodeOnlineMsg>) ostream)
  "Serializes a message object of type '<nodeOnlineMsg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'nodeName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'nodeName))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <nodeOnlineMsg>) istream)
  "Deserializes a message object of type '<nodeOnlineMsg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nodeName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'nodeName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<nodeOnlineMsg>)))
  "Returns string type for a message object of type '<nodeOnlineMsg>"
  "blockChainPack_/nodeOnlineMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'nodeOnlineMsg)))
  "Returns string type for a message object of type 'nodeOnlineMsg"
  "blockChainPack_/nodeOnlineMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<nodeOnlineMsg>)))
  "Returns md5sum for a message object of type '<nodeOnlineMsg>"
  "fa90f177c62ffd4f5a57999c98f4104f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'nodeOnlineMsg)))
  "Returns md5sum for a message object of type 'nodeOnlineMsg"
  "fa90f177c62ffd4f5a57999c98f4104f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<nodeOnlineMsg>)))
  "Returns full string definition for message of type '<nodeOnlineMsg>"
  (cl:format cl:nil "string nodeName~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'nodeOnlineMsg)))
  "Returns full string definition for message of type 'nodeOnlineMsg"
  (cl:format cl:nil "string nodeName~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <nodeOnlineMsg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'nodeName))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <nodeOnlineMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'nodeOnlineMsg
    (cl:cons ':nodeName (nodeName msg))
))
