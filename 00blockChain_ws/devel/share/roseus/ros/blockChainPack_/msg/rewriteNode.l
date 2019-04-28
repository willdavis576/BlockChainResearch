;; Auto-generated. Do not edit!


(when (boundp 'blockChainPack_::rewriteNode)
  (if (not (find-package "BLOCKCHAINPACK_"))
    (make-package "BLOCKCHAINPACK_"))
  (shadow 'rewriteNode (find-package "BLOCKCHAINPACK_")))
(unless (find-package "BLOCKCHAINPACK_::REWRITENODE")
  (make-package "BLOCKCHAINPACK_::REWRITENODE"))

(in-package "ROS")
;;//! \htmlinclude rewriteNode.msg.html


(defclass blockChainPack_::rewriteNode
  :super ros::object
  :slots (_arrayTransfer _fileOrArray ))

(defmethod blockChainPack_::rewriteNode
  (:init
   (&key
    ((:arrayTransfer __arrayTransfer) "")
    ((:fileOrArray __fileOrArray) "")
    )
   (send-super :init)
   (setq _arrayTransfer (string __arrayTransfer))
   (setq _fileOrArray (string __fileOrArray))
   self)
  (:arrayTransfer
   (&optional __arrayTransfer)
   (if __arrayTransfer (setq _arrayTransfer __arrayTransfer)) _arrayTransfer)
  (:fileOrArray
   (&optional __fileOrArray)
   (if __fileOrArray (setq _fileOrArray __fileOrArray)) _fileOrArray)
  (:serialization-length
   ()
   (+
    ;; string _arrayTransfer
    4 (length _arrayTransfer)
    ;; string _fileOrArray
    4 (length _fileOrArray)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _arrayTransfer
       (write-long (length _arrayTransfer) s) (princ _arrayTransfer s)
     ;; string _fileOrArray
       (write-long (length _fileOrArray) s) (princ _fileOrArray s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _arrayTransfer
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _arrayTransfer (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _fileOrArray
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _fileOrArray (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get blockChainPack_::rewriteNode :md5sum-) "50ee5140b974cb540cb9a0539068bb23")
(setf (get blockChainPack_::rewriteNode :datatype-) "blockChainPack_/rewriteNode")
(setf (get blockChainPack_::rewriteNode :definition-)
      "string arrayTransfer
string fileOrArray


")



(provide :blockChainPack_/rewriteNode "50ee5140b974cb540cb9a0539068bb23")


