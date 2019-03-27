; Auto-generated. Do not edit!


(cl:in-package blockChainPack_-msg)


;//! \htmlinclude lastHash.msg.html

(cl:defclass <lastHash> (roslisp-msg-protocol:ros-message)
  ((nodeName
    :reader nodeName
    :initarg :nodeName
    :type cl:string
    :initform "")
   (hash
    :reader hash
    :initarg :hash
    :type cl:string
    :initform ""))
)

(cl:defclass lastHash (<lastHash>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <lastHash>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'lastHash)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name blockChainPack_-msg:<lastHash> is deprecated: use blockChainPack_-msg:lastHash instead.")))

(cl:ensure-generic-function 'nodeName-val :lambda-list '(m))
(cl:defmethod nodeName-val ((m <lastHash>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:nodeName-val is deprecated.  Use blockChainPack_-msg:nodeName instead.")
  (nodeName m))

(cl:ensure-generic-function 'hash-val :lambda-list '(m))
(cl:defmethod hash-val ((m <lastHash>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:hash-val is deprecated.  Use blockChainPack_-msg:hash instead.")
  (hash m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <lastHash>) ostream)
  "Serializes a message object of type '<lastHash>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'nodeName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'nodeName))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'hash))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'hash))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <lastHash>) istream)
  "Deserializes a message object of type '<lastHash>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nodeName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'nodeName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'hash) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'hash) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<lastHash>)))
  "Returns string type for a message object of type '<lastHash>"
  "blockChainPack_/lastHash")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'lastHash)))
  "Returns string type for a message object of type 'lastHash"
  "blockChainPack_/lastHash")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<lastHash>)))
  "Returns md5sum for a message object of type '<lastHash>"
  "66f1a569f696850dc0629c7d1fb0b6b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'lastHash)))
  "Returns md5sum for a message object of type 'lastHash"
  "66f1a569f696850dc0629c7d1fb0b6b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<lastHash>)))
  "Returns full string definition for message of type '<lastHash>"
  (cl:format cl:nil "string nodeName~%string hash~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'lastHash)))
  "Returns full string definition for message of type 'lastHash"
  (cl:format cl:nil "string nodeName~%string hash~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <lastHash>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'nodeName))
     4 (cl:length (cl:slot-value msg 'hash))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <lastHash>))
  "Converts a ROS message object to a list"
  (cl:list 'lastHash
    (cl:cons ':nodeName (nodeName msg))
    (cl:cons ':hash (hash msg))
))
