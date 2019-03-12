; Auto-generated. Do not edit!


(cl:in-package blockChainPack_-msg)


;//! \htmlinclude stringMultiarray.msg.html

(cl:defclass <stringMultiarray> (roslisp-msg-protocol:ros-message)
  ((prodNum
    :reader prodNum
    :initarg :prodNum
    :type cl:integer
    :initform 0)
   (blocks
    :reader blocks
    :initarg :blocks
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass stringMultiarray (<stringMultiarray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <stringMultiarray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'stringMultiarray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name blockChainPack_-msg:<stringMultiarray> is deprecated: use blockChainPack_-msg:stringMultiarray instead.")))

(cl:ensure-generic-function 'prodNum-val :lambda-list '(m))
(cl:defmethod prodNum-val ((m <stringMultiarray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:prodNum-val is deprecated.  Use blockChainPack_-msg:prodNum instead.")
  (prodNum m))

(cl:ensure-generic-function 'blocks-val :lambda-list '(m))
(cl:defmethod blocks-val ((m <stringMultiarray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:blocks-val is deprecated.  Use blockChainPack_-msg:blocks instead.")
  (blocks m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <stringMultiarray>) ostream)
  "Serializes a message object of type '<stringMultiarray>"
  (cl:let* ((signed (cl:slot-value msg 'prodNum)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'blocks))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'blocks))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <stringMultiarray>) istream)
  "Deserializes a message object of type '<stringMultiarray>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'prodNum) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'blocks) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'blocks)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<stringMultiarray>)))
  "Returns string type for a message object of type '<stringMultiarray>"
  "blockChainPack_/stringMultiarray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stringMultiarray)))
  "Returns string type for a message object of type 'stringMultiarray"
  "blockChainPack_/stringMultiarray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<stringMultiarray>)))
  "Returns md5sum for a message object of type '<stringMultiarray>"
  "accb76f5450794af9ee3f3f81a5ea7c0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'stringMultiarray)))
  "Returns md5sum for a message object of type 'stringMultiarray"
  "accb76f5450794af9ee3f3f81a5ea7c0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<stringMultiarray>)))
  "Returns full string definition for message of type '<stringMultiarray>"
  (cl:format cl:nil "int32 prodNum~%string[] blocks~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'stringMultiarray)))
  "Returns full string definition for message of type 'stringMultiarray"
  (cl:format cl:nil "int32 prodNum~%string[] blocks~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <stringMultiarray>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'blocks) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <stringMultiarray>))
  "Converts a ROS message object to a list"
  (cl:list 'stringMultiarray
    (cl:cons ':prodNum (prodNum msg))
    (cl:cons ':blocks (blocks msg))
))
