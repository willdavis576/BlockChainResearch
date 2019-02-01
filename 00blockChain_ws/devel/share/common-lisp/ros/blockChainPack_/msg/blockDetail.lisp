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
    :initform 0))
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
  "b27a6222581411b9d599cbf56966d81d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'blockDetail)))
  "Returns md5sum for a message object of type 'blockDetail"
  "b27a6222581411b9d599cbf56966d81d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<blockDetail>)))
  "Returns full string definition for message of type '<blockDetail>"
  (cl:format cl:nil "int64 blockNumber~%int64 productNumber~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'blockDetail)))
  "Returns full string definition for message of type 'blockDetail"
  (cl:format cl:nil "int64 blockNumber~%int64 productNumber~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <blockDetail>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <blockDetail>))
  "Converts a ROS message object to a list"
  (cl:list 'blockDetail
    (cl:cons ':blockNumber (blockNumber msg))
    (cl:cons ':productNumber (productNumber msg))
))
