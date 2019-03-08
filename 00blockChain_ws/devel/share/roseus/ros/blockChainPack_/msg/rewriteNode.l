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
  :slots (_left _right _element ))

(defmethod blockChainPack_::rewriteNode
  (:init
   (&key
    ((:left __left) 0)
    ((:right __right) 0)
    ((:element __element) "")
    )
   (send-super :init)
   (setq _left (round __left))
   (setq _right (round __right))
   (setq _element (string __element))
   self)
  (:left
   (&optional __left)
   (if __left (setq _left __left)) _left)
  (:right
   (&optional __right)
   (if __right (setq _right __right)) _right)
  (:element
   (&optional __element)
   (if __element (setq _element __element)) _element)
  (:serialization-length
   ()
   (+
    ;; int32 _left
    4
    ;; int32 _right
    4
    ;; string _element
    4 (length _element)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _left
       (write-long _left s)
     ;; int32 _right
       (write-long _right s)
     ;; string _element
       (write-long (length _element) s) (princ _element s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _left
     (setq _left (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _right
     (setq _right (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _element
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _element (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get blockChainPack_::rewriteNode :md5sum-) "de7b9a4f559650249dc7ff7249ac243f")
(setf (get blockChainPack_::rewriteNode :datatype-) "blockChainPack_/rewriteNode")
(setf (get blockChainPack_::rewriteNode :definition-)
      "int32 left
int32 right
string element

")



(provide :blockChainPack_/rewriteNode "de7b9a4f559650249dc7ff7249ac243f")


