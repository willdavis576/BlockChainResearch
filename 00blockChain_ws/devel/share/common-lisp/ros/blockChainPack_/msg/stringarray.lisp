; Auto-generated. Do not edit!


(cl:in-package blockChainPack_-msg)


;//! \htmlinclude stringarray.msg.html

(cl:defclass <stringarray> (roslisp-msg-protocol:ros-message)
  ((blocks
    :reader blocks
    :initarg :blocks
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass stringarray (<stringarray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <stringarray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'stringarray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name blockChainPack_-msg:<stringarray> is deprecated: use blockChainPack_-msg:stringarray instead.")))

(cl:ensure-generic-function 'blocks-val :lambda-list '(m))
(cl:defmethod blocks-val ((m <stringarray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:blocks-val is deprecated.  Use blockChainPack_-msg:blocks instead.")
  (blocks m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <stringarray>) ostream)
  "Serializes a message object of type '<stringarray>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'blocks))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'blocks))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <stringarray>) istream)
  "Deserializes a message object of type '<stringarray>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'blocks) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'blocks)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<stringarray>)))
  "Returns string type for a message object of type '<stringarray>"
  "blockChainPack_/stringarray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stringarray)))
  "Returns string type for a message object of type 'stringarray"
  "blockChainPack_/stringarray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<stringarray>)))
  "Returns md5sum for a message object of type '<stringarray>"
  "bbe9b96b676128983188b5e1fc353be9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'stringarray)))
  "Returns md5sum for a message object of type 'stringarray"
  "bbe9b96b676128983188b5e1fc353be9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<stringarray>)))
  "Returns full string definition for message of type '<stringarray>"
  (cl:format cl:nil "uint8[] blocks~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'stringarray)))
  "Returns full string definition for message of type 'stringarray"
  (cl:format cl:nil "uint8[] blocks~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <stringarray>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'blocks) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <stringarray>))
  "Converts a ROS message object to a list"
  (cl:list 'stringarray
    (cl:cons ':blocks (blocks msg))
))
