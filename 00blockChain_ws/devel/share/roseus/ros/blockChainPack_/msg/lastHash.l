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
  :slots (_nodeName _productNumber _hash ))

(defmethod blockChainPack_::lastHash
  (:init
   (&key
    ((:nodeName __nodeName) "")
    ((:productNumber __productNumber) 0)
    ((:hash __hash) "")
    )
   (send-super :init)
   (setq _nodeName (string __nodeName))
   (setq _productNumber (round __productNumber))
   (setq _hash (string __hash))
   self)
  (:nodeName
   (&optional __nodeName)
   (if __nodeName (setq _nodeName __nodeName)) _nodeName)
  (:productNumber
   (&optional __productNumber)
   (if __productNumber (setq _productNumber __productNumber)) _productNumber)
  (:hash
   (&optional __hash)
   (if __hash (setq _hash __hash)) _hash)
  (:serialization-length
   ()
   (+
    ;; string _nodeName
    4 (length _nodeName)
    ;; int64 _productNumber
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
     ;; string _hash
       (write-long (length _hash) s) (princ _hash s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _nodeName
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _nodeName (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
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
   ;; string _hash
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _hash (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get blockChainPack_::lastHash :md5sum-) "8083626d8f7b25c3a89f2539b4ea325f")
(setf (get blockChainPack_::lastHash :datatype-) "blockChainPack_/lastHash")
(setf (get blockChainPack_::lastHash :definition-)
      "string nodeName
int64 productNumber
string hash

")



(provide :blockChainPack_/lastHash "8083626d8f7b25c3a89f2539b4ea325f")

