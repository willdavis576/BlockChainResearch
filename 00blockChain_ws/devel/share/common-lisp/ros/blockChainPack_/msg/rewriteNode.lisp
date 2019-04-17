; Auto-generated. Do not edit!


(cl:in-package blockChainPack_-msg)


;//! \htmlinclude rewriteNode.msg.html

(cl:defclass <rewriteNode> (roslisp-msg-protocol:ros-message)
  ((arrayTransfer
    :reader arrayTransfer
    :initarg :arrayTransfer
    :type cl:string
    :initform "")
   (fileName
    :reader fileName
    :initarg :fileName
    :type cl:string
    :initform "")
   (logFile
    :reader logFile
    :initarg :logFile
    :type cl:string
    :initform "")
   (logHash
    :reader logHash
    :initarg :logHash
    :type cl:string
    :initform "")
   (REcounter
    :reader REcounter
    :initarg :REcounter
    :type cl:integer
    :initform 0)
   (done
    :reader done
    :initarg :done
    :type cl:integer
    :initform 0))
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

(cl:ensure-generic-function 'fileName-val :lambda-list '(m))
(cl:defmethod fileName-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:fileName-val is deprecated.  Use blockChainPack_-msg:fileName instead.")
  (fileName m))

(cl:ensure-generic-function 'logFile-val :lambda-list '(m))
(cl:defmethod logFile-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:logFile-val is deprecated.  Use blockChainPack_-msg:logFile instead.")
  (logFile m))

(cl:ensure-generic-function 'logHash-val :lambda-list '(m))
(cl:defmethod logHash-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:logHash-val is deprecated.  Use blockChainPack_-msg:logHash instead.")
  (logHash m))

(cl:ensure-generic-function 'REcounter-val :lambda-list '(m))
(cl:defmethod REcounter-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:REcounter-val is deprecated.  Use blockChainPack_-msg:REcounter instead.")
  (REcounter m))

(cl:ensure-generic-function 'done-val :lambda-list '(m))
(cl:defmethod done-val ((m <rewriteNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader blockChainPack_-msg:done-val is deprecated.  Use blockChainPack_-msg:done instead.")
  (done m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rewriteNode>) ostream)
  "Serializes a message object of type '<rewriteNode>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'arrayTransfer))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'arrayTransfer))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'fileName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'fileName))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'logFile))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'logFile))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'logHash))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'logHash))
  (cl:let* ((signed (cl:slot-value msg 'REcounter)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'done)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
      (cl:setf (cl:slot-value msg 'fileName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'fileName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'logFile) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'logFile) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'logHash) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'logHash) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'REcounter) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'done) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
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
  "ce6d37a12366ea5169180721d54de41b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rewriteNode)))
  "Returns md5sum for a message object of type 'rewriteNode"
  "ce6d37a12366ea5169180721d54de41b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rewriteNode>)))
  "Returns full string definition for message of type '<rewriteNode>"
  (cl:format cl:nil "string arrayTransfer~%string fileName~%string logFile~%string logHash~%int64 REcounter~%int64 done~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rewriteNode)))
  "Returns full string definition for message of type 'rewriteNode"
  (cl:format cl:nil "string arrayTransfer~%string fileName~%string logFile~%string logHash~%int64 REcounter~%int64 done~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rewriteNode>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'arrayTransfer))
     4 (cl:length (cl:slot-value msg 'fileName))
     4 (cl:length (cl:slot-value msg 'logFile))
     4 (cl:length (cl:slot-value msg 'logHash))
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rewriteNode>))
  "Converts a ROS message object to a list"
  (cl:list 'rewriteNode
    (cl:cons ':arrayTransfer (arrayTransfer msg))
    (cl:cons ':fileName (fileName msg))
    (cl:cons ':logFile (logFile msg))
    (cl:cons ':logHash (logHash msg))
    (cl:cons ':REcounter (REcounter msg))
    (cl:cons ':done (done msg))
))
