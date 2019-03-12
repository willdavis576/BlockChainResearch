;; Auto-generated. Do not edit!


(when (boundp 'blockChainPack_::stringarray)
  (if (not (find-package "BLOCKCHAINPACK_"))
    (make-package "BLOCKCHAINPACK_"))
  (shadow 'stringarray (find-package "BLOCKCHAINPACK_")))
(unless (find-package "BLOCKCHAINPACK_::STRINGARRAY")
  (make-package "BLOCKCHAINPACK_::STRINGARRAY"))

(in-package "ROS")
;;//! \htmlinclude stringarray.msg.html


(defclass blockChainPack_::stringarray
  :super ros::object
  :slots (_blocks ))

(defmethod blockChainPack_::stringarray
  (:init
   (&key
    ((:blocks __blocks) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _blocks __blocks)
   self)
  (:blocks
   (&optional __blocks)
   (if __blocks (setq _blocks __blocks)) _blocks)
  (:serialization-length
   ()
   (+
    ;; uint8[] _blocks
    (* 1    (length _blocks)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8[] _blocks
     (write-long (length _blocks) s)
     (princ _blocks s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8[] _blocks
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _blocks (make-array n :element-type :char))
     (replace _blocks buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(setf (get blockChainPack_::stringarray :md5sum-) "bbe9b96b676128983188b5e1fc353be9")
(setf (get blockChainPack_::stringarray :datatype-) "blockChainPack_/stringarray")
(setf (get blockChainPack_::stringarray :definition-)
      "uint8[] blocks

")



(provide :blockChainPack_/stringarray "bbe9b96b676128983188b5e1fc353be9")


