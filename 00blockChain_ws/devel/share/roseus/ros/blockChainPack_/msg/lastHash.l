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
  :slots (_nodeName _orderNumber _carrierNumber _hash ))

(defmethod blockChainPack_::lastHash
  (:init
   (&key
    ((:nodeName __nodeName) "")
    ((:orderNumber __orderNumber) 0)
    ((:carrierNumber __carrierNumber) 0)
    ((:hash __hash) "")
    )
   (send-super :init)
   (setq _nodeName (string __nodeName))
   (setq _orderNumber (round __orderNumber))
   (setq _carrierNumber (round __carrierNumber))
   (setq _hash (string __hash))
   self)
  (:nodeName
   (&optional __nodeName)
   (if __nodeName (setq _nodeName __nodeName)) _nodeName)
  (:orderNumber
   (&optional __orderNumber)
   (if __orderNumber (setq _orderNumber __orderNumber)) _orderNumber)
  (:carrierNumber
   (&optional __carrierNumber)
   (if __carrierNumber (setq _carrierNumber __carrierNumber)) _carrierNumber)
  (:hash
   (&optional __hash)
   (if __hash (setq _hash __hash)) _hash)
  (:serialization-length
   ()
   (+
    ;; string _nodeName
    4 (length _nodeName)
    ;; int64 _orderNumber
    8
    ;; int64 _carrierNumber
    8
    ;; string _hash
    4 (length _hash)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _nodeName
       (write-long (length _nodeName) s) (princ _nodeName s)
     ;; int64 _orderNumber
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _orderNumber (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _orderNumber) (= (length (_orderNumber . bv)) 2)) ;; bignum
              (write-long (ash (elt (_orderNumber . bv) 0) 0) s)
              (write-long (ash (elt (_orderNumber . bv) 1) -1) s))
             ((and (class _orderNumber) (= (length (_orderNumber . bv)) 1)) ;; big1
              (write-long (elt (_orderNumber . bv) 0) s)
              (write-long (if (>= _orderNumber 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _orderNumber s)(write-long (if (>= _orderNumber 0) 0 #xffffffff) s)))
     ;; int64 _carrierNumber
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _carrierNumber (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _carrierNumber) (= (length (_carrierNumber . bv)) 2)) ;; bignum
              (write-long (ash (elt (_carrierNumber . bv) 0) 0) s)
              (write-long (ash (elt (_carrierNumber . bv) 1) -1) s))
             ((and (class _carrierNumber) (= (length (_carrierNumber . bv)) 1)) ;; big1
              (write-long (elt (_carrierNumber . bv) 0) s)
              (write-long (if (>= _carrierNumber 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _carrierNumber s)(write-long (if (>= _carrierNumber 0) 0 #xffffffff) s)))
     ;; string _hash
       (write-long (length _hash) s) (princ _hash s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _nodeName
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _nodeName (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _orderNumber
#+(or :alpha :irix6 :x86_64)
      (setf _orderNumber (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _orderNumber (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _carrierNumber
#+(or :alpha :irix6 :x86_64)
      (setf _carrierNumber (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _carrierNumber (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; string _hash
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _hash (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get blockChainPack_::lastHash :md5sum-) "b1a4cb81ebb0c8d7c4108803c6e0dff2")
(setf (get blockChainPack_::lastHash :datatype-) "blockChainPack_/lastHash")
(setf (get blockChainPack_::lastHash :definition-)
      "string nodeName
int64 orderNumber
int64 carrierNumber
string hash

")



(provide :blockChainPack_/lastHash "b1a4cb81ebb0c8d7c4108803c6e0dff2")


