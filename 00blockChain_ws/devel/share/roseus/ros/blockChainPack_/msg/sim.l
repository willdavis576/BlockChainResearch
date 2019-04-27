;; Auto-generated. Do not edit!


(when (boundp 'blockChainPack_::sim)
  (if (not (find-package "BLOCKCHAINPACK_"))
    (make-package "BLOCKCHAINPACK_"))
  (shadow 'sim (find-package "BLOCKCHAINPACK_")))
(unless (find-package "BLOCKCHAINPACK_::SIM")
  (make-package "BLOCKCHAINPACK_::SIM"))

(in-package "ROS")
;;//! \htmlinclude sim.msg.html


(defclass blockChainPack_::sim
  :super ros::object
  :slots (_data ))

(defmethod blockChainPack_::sim
  (:init
   (&key
    ((:data __data) "")
    )
   (send-super :init)
   (setq _data (string __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; string _data
    4 (length _data)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _data
       (write-long (length _data) s) (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get blockChainPack_::sim :md5sum-) "992ce8a1687cec8c8bd883ec73ca41d1")
(setf (get blockChainPack_::sim :datatype-) "blockChainPack_/sim")
(setf (get blockChainPack_::sim :definition-)
      "string data

")



(provide :blockChainPack_/sim "992ce8a1687cec8c8bd883ec73ca41d1")


