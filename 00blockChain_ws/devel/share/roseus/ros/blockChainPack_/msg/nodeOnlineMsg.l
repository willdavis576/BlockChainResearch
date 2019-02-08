;; Auto-generated. Do not edit!


(when (boundp 'blockChainPack_::nodeOnlineMsg)
  (if (not (find-package "BLOCKCHAINPACK_"))
    (make-package "BLOCKCHAINPACK_"))
  (shadow 'nodeOnlineMsg (find-package "BLOCKCHAINPACK_")))
(unless (find-package "BLOCKCHAINPACK_::NODEONLINEMSG")
  (make-package "BLOCKCHAINPACK_::NODEONLINEMSG"))

(in-package "ROS")
;;//! \htmlinclude nodeOnlineMsg.msg.html


(defclass blockChainPack_::nodeOnlineMsg
  :super ros::object
  :slots (_nodeName ))

(defmethod blockChainPack_::nodeOnlineMsg
  (:init
   (&key
    ((:nodeName __nodeName) "")
    )
   (send-super :init)
   (setq _nodeName (string __nodeName))
   self)
  (:nodeName
   (&optional __nodeName)
   (if __nodeName (setq _nodeName __nodeName)) _nodeName)
  (:serialization-length
   ()
   (+
    ;; string _nodeName
    4 (length _nodeName)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _nodeName
       (write-long (length _nodeName) s) (princ _nodeName s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _nodeName
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _nodeName (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get blockChainPack_::nodeOnlineMsg :md5sum-) "fa90f177c62ffd4f5a57999c98f4104f")
(setf (get blockChainPack_::nodeOnlineMsg :datatype-) "blockChainPack_/nodeOnlineMsg")
(setf (get blockChainPack_::nodeOnlineMsg :definition-)
      "string nodeName

")



(provide :blockChainPack_/nodeOnlineMsg "fa90f177c62ffd4f5a57999c98f4104f")


