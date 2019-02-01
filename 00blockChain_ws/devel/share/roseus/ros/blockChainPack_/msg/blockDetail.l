;; Auto-generated. Do not edit!


(when (boundp 'blockChainPack_::blockDetail)
  (if (not (find-package "BLOCKCHAINPACK_"))
    (make-package "BLOCKCHAINPACK_"))
  (shadow 'blockDetail (find-package "BLOCKCHAINPACK_")))
(unless (find-package "BLOCKCHAINPACK_::BLOCKDETAIL")
  (make-package "BLOCKCHAINPACK_::BLOCKDETAIL"))

(in-package "ROS")
;;//! \htmlinclude blockDetail.msg.html


(defclass blockChainPack_::blockDetail
  :super ros::object
  :slots (_blockNumber _productNumber ))

(defmethod blockChainPack_::blockDetail
  (:init
   (&key
    ((:blockNumber __blockNumber) 0)
    ((:productNumber __productNumber) 0)
    )
   (send-super :init)
   (setq _blockNumber (round __blockNumber))
   (setq _productNumber (round __productNumber))
   self)
  (:blockNumber
   (&optional __blockNumber)
   (if __blockNumber (setq _blockNumber __blockNumber)) _blockNumber)
  (:productNumber
   (&optional __productNumber)
   (if __productNumber (setq _productNumber __productNumber)) _productNumber)
  (:serialization-length
   ()
   (+
    ;; int64 _blockNumber
    8
    ;; int64 _productNumber
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _blockNumber
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _blockNumber (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _blockNumber) (= (length (_blockNumber . bv)) 2)) ;; bignum
              (write-long (ash (elt (_blockNumber . bv) 0) 0) s)
              (write-long (ash (elt (_blockNumber . bv) 1) -1) s))
             ((and (class _blockNumber) (= (length (_blockNumber . bv)) 1)) ;; big1
              (write-long (elt (_blockNumber . bv) 0) s)
              (write-long (if (>= _blockNumber 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _blockNumber s)(write-long (if (>= _blockNumber 0) 0 #xffffffff) s)))
     ;; int64 _productNumber
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _productNumber (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _productNumber) (= (length (_productNumber . bv)) 2)) ;; bignum
              (write-long (ash (elt (_productNumber . bv) 0) 0) s)
              (write-long (ash (elt (_productNumber . bv) 1) -1) s))
             ((and (class _productNumber) (= (length (_productNumber . bv)) 1)) ;; big1
              (write-long (elt (_productNumber . bv) 0) s)
              (write-long (if (>= _productNumber 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _productNumber s)(write-long (if (>= _productNumber 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _blockNumber
#+(or :alpha :irix6 :x86_64)
      (setf _blockNumber (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _blockNumber (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _productNumber
#+(or :alpha :irix6 :x86_64)
      (setf _productNumber (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _productNumber (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(setf (get blockChainPack_::blockDetail :md5sum-) "b27a6222581411b9d599cbf56966d81d")
(setf (get blockChainPack_::blockDetail :datatype-) "blockChainPack_/blockDetail")
(setf (get blockChainPack_::blockDetail :definition-)
      "int64 blockNumber
int64 productNumber

")



(provide :blockChainPack_/blockDetail "b27a6222581411b9d599cbf56966d81d")


