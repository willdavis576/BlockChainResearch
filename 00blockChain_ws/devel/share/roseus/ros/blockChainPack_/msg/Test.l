;; Auto-generated. Do not edit!


(when (boundp 'blockChainPack_::Test)
  (if (not (find-package "BLOCKCHAINPACK_"))
    (make-package "BLOCKCHAINPACK_"))
  (shadow 'Test (find-package "BLOCKCHAINPACK_")))
(unless (find-package "BLOCKCHAINPACK_::TEST")
  (make-package "BLOCKCHAINPACK_::TEST"))

(in-package "ROS")
;;//! \htmlinclude Test.msg.html


(defclass blockChainPack_::Test
  :super ros::object
  :slots (_testingMsg ))

(defmethod blockChainPack_::Test
  (:init
   (&key
    ((:testingMsg __testingMsg) "")
    )
   (send-super :init)
   (setq _testingMsg (string __testingMsg))
   self)
  (:testingMsg
   (&optional __testingMsg)
   (if __testingMsg (setq _testingMsg __testingMsg)) _testingMsg)
  (:serialization-length
   ()
   (+
    ;; string _testingMsg
    4 (length _testingMsg)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _testingMsg
       (write-long (length _testingMsg) s) (princ _testingMsg s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _testingMsg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _testingMsg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get blockChainPack_::Test :md5sum-) "78c90679f25a95e5f459c98217d5f15a")
(setf (get blockChainPack_::Test :datatype-) "blockChainPack_/Test")
(setf (get blockChainPack_::Test :definition-)
      "string testingMsg

")



(provide :blockChainPack_/Test "78c90679f25a95e5f459c98217d5f15a")


