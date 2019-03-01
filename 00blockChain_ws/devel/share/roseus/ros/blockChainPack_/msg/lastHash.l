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
  :slots (_nodeName _blockchainNumber _hash ))

(defmethod blockChainPack_::lastHash
  (:init
   (&key
    ((:nodeName __nodeName) "")
    ((:blockchainNumber __blockchainNumber) 0)
    ((:hash __hash) "")
    )
   (send-super :init)
   (setq _nodeName (string __nodeName))
   (setq _blockchainNumber (round __blockchainNumber))
   (setq _hash (string __hash))
   self)
  (:nodeName
   (&optional __nodeName)
   (if __nodeName (setq _nodeName __nodeName)) _nodeName)
  (:blockchainNumber
   (&optional __blockchainNumber)
   (if __blockchainNumber (setq _blockchainNumber __blockchainNumber)) _blockchainNumber)
  (:hash
   (&optional __hash)
   (if __hash (setq _hash __hash)) _hash)
  (:serialization-length
   ()
   (+
    ;; string _nodeName
    4 (length _nodeName)
    ;; int64 _blockchainNumber
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
     ;; int64 _blockchainNumber
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _blockchainNumber (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _blockchainNumber) (= (length (_blockchainNumber . bv)) 2)) ;; bignum
              (write-long (ash (elt (_blockchainNumber . bv) 0) 0) s)
              (write-long (ash (elt (_blockchainNumber . bv) 1) -1) s))
             ((and (class _blockchainNumber) (= (length (_blockchainNumber . bv)) 1)) ;; big1
              (write-long (elt (_blockchainNumber . bv) 0) s)
              (write-long (if (>= _blockchainNumber 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _blockchainNumber s)(write-long (if (>= _blockchainNumber 0) 0 #xffffffff) s)))
     ;; string _hash
       (write-long (length _hash) s) (princ _hash s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _nodeName
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _nodeName (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _blockchainNumber
#+(or :alpha :irix6 :x86_64)
      (setf _blockchainNumber (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _blockchainNumber (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(setf (get blockChainPack_::lastHash :md5sum-) "b2ba33a8c1f1e56810104ccd6ef48d61")
(setf (get blockChainPack_::lastHash :datatype-) "blockChainPack_/lastHash")
(setf (get blockChainPack_::lastHash :definition-)
      "string nodeName
int64 blockchainNumber
string hash

")



(provide :blockChainPack_/lastHash "b2ba33a8c1f1e56810104ccd6ef48d61")


