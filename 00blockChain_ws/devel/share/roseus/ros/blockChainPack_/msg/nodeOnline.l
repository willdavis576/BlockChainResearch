;; Auto-generated. Do not edit!


(when (boundp 'blockChainPack_::nodeOnline)
  (if (not (find-package "BLOCKCHAINPACK_"))
    (make-package "BLOCKCHAINPACK_"))
  (shadow 'nodeOnline (find-package "BLOCKCHAINPACK_")))
(unless (find-package "BLOCKCHAINPACK_::NODEONLINE")
  (make-package "BLOCKCHAINPACK_::NODEONLINE"))

(in-package "ROS")
;;//! \htmlinclude nodeOnline.msg.html


(defclass blockChainPack_::nodeOnline
  :super ros::object
  :slots (_nodeName ))

(defmethod blockChainPack_::nodeOnline
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

(setf (get blockChainPack_::nodeOnline :md5sum-) "fa90f177c62ffd4f5a57999c98f4104f")
(setf (get blockChainPack_::nodeOnline :datatype-) "blockChainPack_/nodeOnline")
(setf (get blockChainPack_::nodeOnline :definition-)
      "string nodeName

")



(provide :blockChainPack_/nodeOnline "fa90f177c62ffd4f5a57999c98f4104f")


