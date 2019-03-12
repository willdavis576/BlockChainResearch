;; Auto-generated. Do not edit!


(when (boundp 'blockChainPack_::stringMultiarray)
  (if (not (find-package "BLOCKCHAINPACK_"))
    (make-package "BLOCKCHAINPACK_"))
  (shadow 'stringMultiarray (find-package "BLOCKCHAINPACK_")))
(unless (find-package "BLOCKCHAINPACK_::STRINGMULTIARRAY")
  (make-package "BLOCKCHAINPACK_::STRINGMULTIARRAY"))

(in-package "ROS")
;;//! \htmlinclude stringMultiarray.msg.html


(defclass blockChainPack_::stringMultiarray
  :super ros::object
  :slots (_prodNum _blocks ))

(defmethod blockChainPack_::stringMultiarray
  (:init
   (&key
    ((:prodNum __prodNum) 0)
    ((:blocks __blocks) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _prodNum (round __prodNum))
   (setq _blocks __blocks)
   self)
  (:prodNum
   (&optional __prodNum)
   (if __prodNum (setq _prodNum __prodNum)) _prodNum)
  (:blocks
   (&optional __blocks)
   (if __blocks (setq _blocks __blocks)) _blocks)
  (:serialization-length
   ()
   (+
    ;; int32 _prodNum
    4
    ;; string[] _blocks
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _blocks)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _prodNum
       (write-long _prodNum s)
     ;; string[] _blocks
     (write-long (length _blocks) s)
     (dolist (elem _blocks)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _prodNum
     (setq _prodNum (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string[] _blocks
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _blocks (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _blocks i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(setf (get blockChainPack_::stringMultiarray :md5sum-) "accb76f5450794af9ee3f3f81a5ea7c0")
(setf (get blockChainPack_::stringMultiarray :datatype-) "blockChainPack_/stringMultiarray")
(setf (get blockChainPack_::stringMultiarray :definition-)
      "int32 prodNum
string[] blocks

")



(provide :blockChainPack_/stringMultiarray "accb76f5450794af9ee3f3f81a5ea7c0")


