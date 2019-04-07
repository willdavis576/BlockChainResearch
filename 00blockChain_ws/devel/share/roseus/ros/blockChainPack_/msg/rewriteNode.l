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
  :slots (_SblockTimeStamp _SblockTrans _SblockProductCode _SCarrierNumber _done ))

(defmethod blockChainPack_::rewriteNode
  (:init
   (&key
    ((:SblockTimeStamp __SblockTimeStamp) "")
    ((:SblockTrans __SblockTrans) "")
    ((:SblockProductCode __SblockProductCode) "")
    ((:SCarrierNumber __SCarrierNumber) "")
    ((:done __done) 0)
    )
   (send-super :init)
   (setq _SblockTimeStamp (string __SblockTimeStamp))
   (setq _SblockTrans (string __SblockTrans))
   (setq _SblockProductCode (string __SblockProductCode))
   (setq _SCarrierNumber (string __SCarrierNumber))
   (setq _done (round __done))
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
  (:SCarrierNumber
   (&optional __SCarrierNumber)
   (if __SCarrierNumber (setq _SCarrierNumber __SCarrierNumber)) _SCarrierNumber)
  (:done
   (&optional __done)
   (if __done (setq _done __done)) _done)
  (:serialization-length
   ()
   (+
    ;; string _SblockTimeStamp
    4 (length _SblockTimeStamp)
    ;; string _SblockTrans
    4 (length _SblockTrans)
    ;; string _SblockProductCode
    4 (length _SblockProductCode)
    ;; string _SCarrierNumber
    4 (length _SCarrierNumber)
    ;; int64 _done
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
     ;; string _SblockProductCode
       (write-long (length _SblockProductCode) s) (princ _SblockProductCode s)
     ;; string _SCarrierNumber
       (write-long (length _SCarrierNumber) s) (princ _SCarrierNumber s)
     ;; int64 _done
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _done (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _done) (= (length (_done . bv)) 2)) ;; bignum
              (write-long (ash (elt (_done . bv) 0) 0) s)
              (write-long (ash (elt (_done . bv) 1) -1) s))
             ((and (class _done) (= (length (_done . bv)) 1)) ;; big1
              (write-long (elt (_done . bv) 0) s)
              (write-long (if (>= _done 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _done s)(write-long (if (>= _done 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _SblockTimeStamp
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _SblockTimeStamp (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _SblockTrans
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _SblockTrans (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _SblockProductCode
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _SblockProductCode (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _SCarrierNumber
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _SCarrierNumber (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _done
#+(or :alpha :irix6 :x86_64)
      (setf _done (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _done (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(setf (get blockChainPack_::rewriteNode :md5sum-) "69b49f45a96149b09ab624e642e92d9e")
(setf (get blockChainPack_::rewriteNode :datatype-) "blockChainPack_/rewriteNode")
(setf (get blockChainPack_::rewriteNode :definition-)
      "string SblockTimeStamp
string SblockTrans
string SblockProductCode
string SCarrierNumber
int64 done

")



(provide :blockChainPack_/rewriteNode "69b49f45a96149b09ab624e642e92d9e")


