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
  :slots (_SblockTimeStamp _SblockTrans _SblockProductCode _SCarrierNumber ))

(defmethod blockChainPack_::rewriteNode
  (:init
   (&key
    ((:SblockTimeStamp __SblockTimeStamp) "")
    ((:SblockTrans __SblockTrans) "")
    ((:SblockProductCode __SblockProductCode) "")
    ((:SCarrierNumber __SCarrierNumber) "")
    )
   (send-super :init)
   (setq _SblockTimeStamp (string __SblockTimeStamp))
   (setq _SblockTrans (string __SblockTrans))
   (setq _SblockProductCode (string __SblockProductCode))
   (setq _SCarrierNumber (string __SCarrierNumber))
   self)
  (:SblockTimeStamp
   (&optional __SblockTimeStamp)
   (if __SblockTimeStamp (setq _SblockTimeStamp __SblockTimeStamp)) _SblockTimeStamp)
  (:SblockTrans
   (&optional __SblockTrans)
   (if __SblockTrans (setq _SblockTrans __SblockTrans)) _SblockTrans)
  (:SblockProductCode
   (&optional __SblockProductCode)
   (if __SblockProductCode (setq _SblockProductCode __SblockProductCode)) _SblockProductCode)
  (:SCarrierNumber
   (&optional __SCarrierNumber)
   (if __SCarrierNumber (setq _SCarrierNumber __SCarrierNumber)) _SCarrierNumber)
  (:serialization-length
   ()
   (+
    ;; string _SblockTimeStamp
    4 (length _SblockTimeStamp)
    ;; string _SblockTrans
    4 (length _SblockTrans)
    ;; string _SblockProductCode
    4 (length _SblockProductCode)
    ;; string _SCarrierNumber
    4 (length _SCarrierNumber)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _SblockTimeStamp
       (write-long (length _SblockTimeStamp) s) (princ _SblockTimeStamp s)
     ;; string _SblockTrans
       (write-long (length _SblockTrans) s) (princ _SblockTrans s)
     ;; string _SblockProductCode
       (write-long (length _SblockProductCode) s) (princ _SblockProductCode s)
     ;; string _SCarrierNumber
       (write-long (length _SCarrierNumber) s) (princ _SCarrierNumber s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _SblockTimeStamp
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _SblockTimeStamp (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _SblockTrans
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _SblockTrans (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _SblockProductCode
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _SblockProductCode (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _SCarrierNumber
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _SCarrierNumber (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get blockChainPack_::rewriteNode :md5sum-) "7efbc7ca051609e91b5eb44f1e5cdf10")
(setf (get blockChainPack_::rewriteNode :datatype-) "blockChainPack_/rewriteNode")
(setf (get blockChainPack_::rewriteNode :definition-)
      "string SblockTimeStamp
string SblockTrans
string SblockProductCode
string SCarrierNumber


")



(provide :blockChainPack_/rewriteNode "7efbc7ca051609e91b5eb44f1e5cdf10")


