; Auto-generated. Do not edit!


(cl:in-package blockChainPack_-msg)


;//! \htmlinclude Test.msg.html

(cl:defclass <Test> (roslisp-msg-protocol:ros-message)
  ((testingMsg
    :reader testingMsg
    :initarg :testingMsg
    :type cl:string
    :initform ""))
)

(cl:defclass Test (<Test>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Test>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Test)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name blockChainPack_-msg:<Test> is deprecated: use blockChainPack_-msg:Test instead.")))

(cl:ensure-generic-function 'testingMsg-val :lambda-list '(m))
(cl:defmethod testingMsg-val ((m <Test>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:testingMsg-val is deprecated.  Use blockChainPack_-msg:testingMsg instead.")
  (testingMsg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Test>) ostream)
  "Serializes a message object of type '<Test>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'testingMsg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'testingMsg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Test>) istream)
  "Deserializes a message object of type '<Test>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'testingMsg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'testingMsg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Test>)))
  "Returns string type for a message object of type '<Test>"
  "blockChainPack_/Test")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Test)))
  "Returns string type for a message object of type 'Test"
  "blockChainPack_/Test")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Test>)))
  "Returns md5sum for a message object of type '<Test>"
  "78c90679f25a95e5f459c98217d5f15a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Test)))
  "Returns md5sum for a message object of type 'Test"
  "78c90679f25a95e5f459c98217d5f15a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Test>)))
  "Returns full string definition for message of type '<Test>"
  (cl:format cl:nil "string testingMsg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Test)))
  "Returns full string definition for message of type 'Test"
  (cl:format cl:nil "string testingMsg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Test>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'testingMsg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Test>))
  "Converts a ROS message object to a list"
  (cl:list 'Test
    (cl:cons ':testingMsg (testingMsg msg))
))
