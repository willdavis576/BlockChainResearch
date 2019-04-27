; Auto-generated. Do not edit!


(cl:in-package blockChainPack_-msg)


;//! \htmlinclude finish.msg.html

(cl:defclass <finish> (roslisp-msg-protocol:ros-message)
  ((compFiles
    :reader compFiles
    :initarg :compFiles
    :type cl:integer
    :initform 0))
)

(cl:defclass finish (<finish>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <finish>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'finish)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name blockChainPack_-msg:<finish> is deprecated: use blockChainPack_-msg:finish instead.")))

(cl:ensure-generic-function 'compFiles-val :lambda-list '(m))
(cl:defmethod compFiles-val ((m <finish>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:compFiles-val is deprecated.  Use blockChainPack_-msg:compFiles instead.")
  (compFiles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <finish>) ostream)
  "Serializes a message object of type '<finish>"
  (cl:let* ((signed (cl:slot-value msg 'compFiles)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <finish>) istream)
  "Deserializes a message object of type '<finish>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'compFiles) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<finish>)))
  "Returns string type for a message object of type '<finish>"
  "blockChainPack_/finish")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'finish)))
  "Returns string type for a message object of type 'finish"
  "blockChainPack_/finish")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<finish>)))
  "Returns md5sum for a message object of type '<finish>"
  "32144edba68833e7b59cc9286ebcccc6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'finish)))
  "Returns md5sum for a message object of type 'finish"
  "32144edba68833e7b59cc9286ebcccc6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<finish>)))
  "Returns full string definition for message of type '<finish>"
  (cl:format cl:nil "int64 compFiles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'finish)))
  "Returns full string definition for message of type 'finish"
  (cl:format cl:nil "int64 compFiles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <finish>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <finish>))
  "Converts a ROS message object to a list"
  (cl:list 'finish
    (cl:cons ':compFiles (compFiles msg))
))
