;; Auto-generated. Do not edit!


(when (boundp 'blockChainPack_::lastHash)
  (if (not (find-package "BLOCKCHAINPACK_"))
    (make-package "BLOCKCHAINPACK_"))
  (shadow 'lastHash (find-package "BLOCKCHAINPACK_")))
(unless (find-package "BLOCKCHAINPACK_::LASTHASH")
  (make-package "BLOCKCHAINPACK_::LASTHASH"))

(in-package "ROS")
;;//! \htmlinclude lastHash.msg.html


(defclass blockChainPack_::lastHash
  :super ros::object
  :slots (_nodeName _hash ))

(defmethod blockChainPack_::lastHash
  (:init
   (&key
    ((:nodeName __nodeName) "")
    ((:hash __hash) "")
    )
   (send-super :init)
   (setq _nodeName (string __nodeName))
   (setq _hash (string __hash))
   self)
  (:nodeName
   (&optional __nodeName)
   (if __nodeName (setq _nodeName __nodeName)) _nodeName)
  (:hash
   (&optional __hash)
   (if __hash (setq _hash __hash)) _hash)
  (:serialization-length
   ()
   (+
    ;; string _nodeName
    4 (length _nodeName)
    ;; string _hash
    4 (length _hash)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _nodeName
       (write-long (length _nodeName) s) (princ _nodeName s)
     ;; string _hash
       (write-long (length _hash) s) (princ _hash s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _nodeName
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _nodeName (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _hash
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _hash (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get blockChainPack_::lastHash :md5sum-) "66f1a569f696850dc0629c7d1fb0b6b9")
(setf (get blockChainPack_::lastHash :datatype-) "blockChainPack_/lastHash")
(setf (get blockChainPack_::lastHash :definition-)
      "string nodeName
string hash

")



(provide :blockChainPack_/lastHash "66f1a569f696850dc0629c7d1fb0b6b9")


