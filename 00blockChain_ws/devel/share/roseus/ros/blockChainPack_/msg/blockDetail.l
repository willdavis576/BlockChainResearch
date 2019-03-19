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
  :slots (_blockNumber _productNumber _timeStamp _station _serialNumber _blockHash _previousHash ))

(defmethod blockChainPack_::blockDetail
  (:init
   (&key
    ((:blockNumber __blockNumber) 0)
    ((:productNumber __productNumber) 0)
    ((:timeStamp __timeStamp) "")
    ((:station __station) "")
    ((:serialNumber __serialNumber) "")
    ((:blockHash __blockHash) "")
    ((:previousHash __previousHash) "")
    )
   (send-super :init)
   (setq _blockNumber (round __blockNumber))
   (setq _productNumber (round __productNumber))
   (setq _timeStamp (string __timeStamp))
   (setq _station (string __station))
   (setq _serialNumber (string __serialNumber))
   (setq _blockHash (string __blockHash))
   (setq _previousHash (string __previousHash))
   self)
  (:blockNumber
   (&optional __blockNumber)
   (if __blockNumber (setq _blockNumber __blockNumber)) _blockNumber)
  (:productNumber
   (&optional __productNumber)
   (if __productNumber (setq _productNumber __productNumber)) _productNumber)
  (:timeStamp
   (&optional __timeStamp)
   (if __timeStamp (setq _timeStamp __timeStamp)) _timeStamp)
  (:station
   (&optional __station)
   (if __station (setq _station __station)) _station)
  (:serialNumber
   (&optional __serialNumber)
   (if __serialNumber (setq _serialNumber __serialNumber)) _serialNumber)
  (:blockHash
   (&optional __blockHash)
   (if __blockHash (setq _blockHash __blockHash)) _blockHash)
  (:previousHash
   (&optional __previousHash)
   (if __previousHash (setq _previousHash __previousHash)) _previousHash)
  (:serialization-length
   ()
   (+
    ;; int64 _blockNumber
    8
    ;; int64 _productNumber
    8
    ;; string _timeStamp
    4 (length _timeStamp)
    ;; string _station
    4 (length _station)
    ;; string _serialNumber
    4 (length _serialNumber)
    ;; string _blockHash
    4 (length _blockHash)
    ;; string _previousHash
    4 (length _previousHash)
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
     ;; string _timeStamp
       (write-long (length _timeStamp) s) (princ _timeStamp s)
     ;; string _station
       (write-long (length _station) s) (princ _station s)
     ;; string _serialNumber
       (write-long (length _serialNumber) s) (princ _serialNumber s)
     ;; string _blockHash
       (write-long (length _blockHash) s) (princ _blockHash s)
     ;; string _previousHash
       (write-long (length _previousHash) s) (princ _previousHash s)
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
   ;; string _timeStamp
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _timeStamp (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _station
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _station (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _serialNumber
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _serialNumber (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _blockHash
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _blockHash (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _previousHash
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _previousHash (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get blockChainPack_::blockDetail :md5sum-) "091c883f51da1788c7811b429bd9b8be")
(setf (get blockChainPack_::blockDetail :datatype-) "blockChainPack_/blockDetail")
(setf (get blockChainPack_::blockDetail :definition-)
      "int64 blockNumber
int64 productNumber
string timeStamp
string station
string serialNumber
string blockHash
string previousHash

")



(provide :blockChainPack_/blockDetail "091c883f51da1788c7811b429bd9b8be")


