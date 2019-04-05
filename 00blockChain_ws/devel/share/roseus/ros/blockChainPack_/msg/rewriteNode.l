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
  :slots (_SblockTimeStamp _SblockTrans _SblockProductCode _SblockHash _SblockPreviousHash _SCarrierNumber _firstIndex _secondIndex _thirdIndex ))

(defmethod blockChainPack_::rewriteNode
  (:init
   (&key
    ((:SblockTimeStamp __SblockTimeStamp) "")
    ((:SblockTrans __SblockTrans) "")
    ((:SblockProductCode __SblockProductCode) 0)
    ((:SblockHash __SblockHash) "")
    ((:SblockPreviousHash __SblockPreviousHash) "")
    ((:SCarrierNumber __SCarrierNumber) 0)
    ((:firstIndex __firstIndex) 0)
    ((:secondIndex __secondIndex) 0)
    ((:thirdIndex __thirdIndex) 0)
    )
   (send-super :init)
   (setq _SblockTimeStamp (string __SblockTimeStamp))
   (setq _SblockTrans (string __SblockTrans))
   (setq _SblockProductCode (round __SblockProductCode))
   (setq _SblockHash (string __SblockHash))
   (setq _SblockPreviousHash (string __SblockPreviousHash))
   (setq _SCarrierNumber (round __SCarrierNumber))
   (setq _firstIndex (round __firstIndex))
   (setq _secondIndex (round __secondIndex))
   (setq _thirdIndex (round __thirdIndex))
   self)
  (:SblockTimeStamp
   (&optional __SblockTimeStamp)
   (if __SblockTimeStamp (setq _SblockTimeStamp __SblockTimeStamp)) _SblockTimeStamp)
  (:SblockTrans
   (&optional __SblockTrans)
   (if __SblockTrans (setq _SblockTrans __SblockTrans)) _SblockTrans)
  (:SblockProductCode
   (&optional __SblockProductCode)
   (if __SblockProductCode (setq _SblockProductCode __SblockProductCode)) _SblockProductCode)
  (:SblockHash
   (&optional __SblockHash)
   (if __SblockHash (setq _SblockHash __SblockHash)) _SblockHash)
  (:SblockPreviousHash
   (&optional __SblockPreviousHash)
   (if __SblockPreviousHash (setq _SblockPreviousHash __SblockPreviousHash)) _SblockPreviousHash)
  (:SCarrierNumber
   (&optional __SCarrierNumber)
   (if __SCarrierNumber (setq _SCarrierNumber __SCarrierNumber)) _SCarrierNumber)
  (:firstIndex
   (&optional __firstIndex)
   (if __firstIndex (setq _firstIndex __firstIndex)) _firstIndex)
  (:secondIndex
   (&optional __secondIndex)
   (if __secondIndex (setq _secondIndex __secondIndex)) _secondIndex)
  (:thirdIndex
   (&optional __thirdIndex)
   (if __thirdIndex (setq _thirdIndex __thirdIndex)) _thirdIndex)
  (:serialization-length
   ()
   (+
    ;; string _SblockTimeStamp
    4 (length _SblockTimeStamp)
    ;; string _SblockTrans
    4 (length _SblockTrans)
    ;; int64 _SblockProductCode
    8
    ;; string _SblockHash
    4 (length _SblockHash)
    ;; string _SblockPreviousHash
    4 (length _SblockPreviousHash)
    ;; int64 _SCarrierNumber
    8
    ;; int64 _firstIndex
    8
    ;; int64 _secondIndex
    8
    ;; int64 _thirdIndex
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _SblockTimeStamp
       (write-long (length _SblockTimeStamp) s) (princ _SblockTimeStamp s)
     ;; string _SblockTrans
       (write-long (length _SblockTrans) s) (princ _SblockTrans s)
     ;; int64 _SblockProductCode
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _SblockProductCode (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _SblockProductCode) (= (length (_SblockProductCode . bv)) 2)) ;; bignum
              (write-long (ash (elt (_SblockProductCode . bv) 0) 0) s)
              (write-long (ash (elt (_SblockProductCode . bv) 1) -1) s))
             ((and (class _SblockProductCode) (= (length (_SblockProductCode . bv)) 1)) ;; big1
              (write-long (elt (_SblockProductCode . bv) 0) s)
              (write-long (if (>= _SblockProductCode 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _SblockProductCode s)(write-long (if (>= _SblockProductCode 0) 0 #xffffffff) s)))
     ;; string _SblockHash
       (write-long (length _SblockHash) s) (princ _SblockHash s)
     ;; string _SblockPreviousHash
       (write-long (length _SblockPreviousHash) s) (princ _SblockPreviousHash s)
     ;; int64 _SCarrierNumber
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _SCarrierNumber (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _SCarrierNumber) (= (length (_SCarrierNumber . bv)) 2)) ;; bignum
              (write-long (ash (elt (_SCarrierNumber . bv) 0) 0) s)
              (write-long (ash (elt (_SCarrierNumber . bv) 1) -1) s))
             ((and (class _SCarrierNumber) (= (length (_SCarrierNumber . bv)) 1)) ;; big1
              (write-long (elt (_SCarrierNumber . bv) 0) s)
              (write-long (if (>= _SCarrierNumber 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _SCarrierNumber s)(write-long (if (>= _SCarrierNumber 0) 0 #xffffffff) s)))
     ;; int64 _firstIndex
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _firstIndex (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _firstIndex) (= (length (_firstIndex . bv)) 2)) ;; bignum
              (write-long (ash (elt (_firstIndex . bv) 0) 0) s)
              (write-long (ash (elt (_firstIndex . bv) 1) -1) s))
             ((and (class _firstIndex) (= (length (_firstIndex . bv)) 1)) ;; big1
              (write-long (elt (_firstIndex . bv) 0) s)
              (write-long (if (>= _firstIndex 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _firstIndex s)(write-long (if (>= _firstIndex 0) 0 #xffffffff) s)))
     ;; int64 _secondIndex
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _secondIndex (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _secondIndex) (= (length (_secondIndex . bv)) 2)) ;; bignum
              (write-long (ash (elt (_secondIndex . bv) 0) 0) s)
              (write-long (ash (elt (_secondIndex . bv) 1) -1) s))
             ((and (class _secondIndex) (= (length (_secondIndex . bv)) 1)) ;; big1
              (write-long (elt (_secondIndex . bv) 0) s)
              (write-long (if (>= _secondIndex 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _secondIndex s)(write-long (if (>= _secondIndex 0) 0 #xffffffff) s)))
     ;; int64 _thirdIndex
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _thirdIndex (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _thirdIndex) (= (length (_thirdIndex . bv)) 2)) ;; bignum
              (write-long (ash (elt (_thirdIndex . bv) 0) 0) s)
              (write-long (ash (elt (_thirdIndex . bv) 1) -1) s))
             ((and (class _thirdIndex) (= (length (_thirdIndex . bv)) 1)) ;; big1
              (write-long (elt (_thirdIndex . bv) 0) s)
              (write-long (if (>= _thirdIndex 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _thirdIndex s)(write-long (if (>= _thirdIndex 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _SblockTimeStamp
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _SblockTimeStamp (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _SblockTrans
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _SblockTrans (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _SblockProductCode
#+(or :alpha :irix6 :x86_64)
      (setf _SblockProductCode (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _SblockProductCode (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; string _SblockHash
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _SblockHash (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _SblockPreviousHash
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _SblockPreviousHash (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _SCarrierNumber
#+(or :alpha :irix6 :x86_64)
      (setf _SCarrierNumber (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _SCarrierNumber (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _firstIndex
#+(or :alpha :irix6 :x86_64)
      (setf _firstIndex (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _firstIndex (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _secondIndex
#+(or :alpha :irix6 :x86_64)
      (setf _secondIndex (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _secondIndex (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _thirdIndex
#+(or :alpha :irix6 :x86_64)
      (setf _thirdIndex (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _thirdIndex (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(setf (get blockChainPack_::rewriteNode :md5sum-) "b722726d77ee12b8172165f1aabcd67c")
(setf (get blockChainPack_::rewriteNode :datatype-) "blockChainPack_/rewriteNode")
(setf (get blockChainPack_::rewriteNode :definition-)
      "string SblockTimeStamp
string SblockTrans
int64 SblockProductCode
string SblockHash
string SblockPreviousHash
int64 SCarrierNumber

int64 firstIndex
int64 secondIndex
int64 thirdIndex

")



(provide :blockChainPack_/rewriteNode "b722726d77ee12b8172165f1aabcd67c")


