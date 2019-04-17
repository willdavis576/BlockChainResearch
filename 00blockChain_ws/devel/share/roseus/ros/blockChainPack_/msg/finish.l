;; Auto-generated. Do not edit!


(when (boundp 'blockChainPack_::finish)
  (if (not (find-package "BLOCKCHAINPACK_"))
    (make-package "BLOCKCHAINPACK_"))
  (shadow 'finish (find-package "BLOCKCHAINPACK_")))
(unless (find-package "BLOCKCHAINPACK_::FINISH")
  (make-package "BLOCKCHAINPACK_::FINISH"))

(in-package "ROS")
;;//! \htmlinclude finish.msg.html


(defclass blockChainPack_::finish
  :super ros::object
  :slots (_compFiles ))

(defmethod blockChainPack_::finish
  (:init
   (&key
    ((:compFiles __compFiles) 0)
    )
   (send-super :init)
   (setq _compFiles (round __compFiles))
   self)
  (:compFiles
   (&optional __compFiles)
   (if __compFiles (setq _compFiles __compFiles)) _compFiles)
  (:serialization-length
   ()
   (+
    ;; int64 _compFiles
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _compFiles
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _compFiles (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _compFiles) (= (length (_compFiles . bv)) 2)) ;; bignum
              (write-long (ash (elt (_compFiles . bv) 0) 0) s)
              (write-long (ash (elt (_compFiles . bv) 1) -1) s))
             ((and (class _compFiles) (= (length (_compFiles . bv)) 1)) ;; big1
              (write-long (elt (_compFiles . bv) 0) s)
              (write-long (if (>= _compFiles 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _compFiles s)(write-long (if (>= _compFiles 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _compFiles
#+(or :alpha :irix6 :x86_64)
      (setf _compFiles (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _compFiles (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get blockChainPack_::finish :md5sum-) "32144edba68833e7b59cc9286ebcccc6")
(setf (get blockChainPack_::finish :datatype-) "blockChainPack_/finish")
(setf (get blockChainPack_::finish :definition-)
      "int64 compFiles

")



(provide :blockChainPack_/finish "32144edba68833e7b59cc9286ebcccc6")


