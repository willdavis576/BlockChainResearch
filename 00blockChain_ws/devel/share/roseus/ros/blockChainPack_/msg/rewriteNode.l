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
  :slots (_arrayTransfer _fileName _logFile _logHash _fileOrArray _REcounter _carrier _done ))

(defmethod blockChainPack_::rewriteNode
  (:init
   (&key
    ((:arrayTransfer __arrayTransfer) "")
    ((:fileName __fileName) "")
    ((:logFile __logFile) "")
    ((:logHash __logHash) "")
    ((:fileOrArray __fileOrArray) "")
    ((:REcounter __REcounter) 0)
    ((:carrier __carrier) 0)
    ((:done __done) 0)
    )
   (send-super :init)
   (setq _arrayTransfer (string __arrayTransfer))
   (setq _fileName (string __fileName))
   (setq _logFile (string __logFile))
   (setq _logHash (string __logHash))
   (setq _fileOrArray (string __fileOrArray))
   (setq _REcounter (round __REcounter))
   (setq _carrier (round __carrier))
   (setq _done (round __done))
   self)
  (:arrayTransfer
   (&optional __arrayTransfer)
   (if __arrayTransfer (setq _arrayTransfer __arrayTransfer)) _arrayTransfer)
  (:fileName
   (&optional __fileName)
   (if __fileName (setq _fileName __fileName)) _fileName)
  (:logFile
   (&optional __logFile)
   (if __logFile (setq _logFile __logFile)) _logFile)
  (:logHash
   (&optional __logHash)
   (if __logHash (setq _logHash __logHash)) _logHash)
  (:fileOrArray
   (&optional __fileOrArray)
   (if __fileOrArray (setq _fileOrArray __fileOrArray)) _fileOrArray)
  (:REcounter
   (&optional __REcounter)
   (if __REcounter (setq _REcounter __REcounter)) _REcounter)
  (:carrier
   (&optional __carrier)
   (if __carrier (setq _carrier __carrier)) _carrier)
  (:done
   (&optional __done)
   (if __done (setq _done __done)) _done)
  (:serialization-length
   ()
   (+
    ;; string _arrayTransfer
    4 (length _arrayTransfer)
    ;; string _fileName
    4 (length _fileName)
    ;; string _logFile
    4 (length _logFile)
    ;; string _logHash
    4 (length _logHash)
    ;; string _fileOrArray
    4 (length _fileOrArray)
    ;; int64 _REcounter
    8
    ;; int64 _carrier
    8
    ;; int64 _done
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _arrayTransfer
       (write-long (length _arrayTransfer) s) (princ _arrayTransfer s)
     ;; string _fileName
       (write-long (length _fileName) s) (princ _fileName s)
     ;; string _logFile
       (write-long (length _logFile) s) (princ _logFile s)
     ;; string _logHash
       (write-long (length _logHash) s) (princ _logHash s)
     ;; string _fileOrArray
       (write-long (length _fileOrArray) s) (princ _fileOrArray s)
     ;; int64 _REcounter
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _REcounter (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _REcounter) (= (length (_REcounter . bv)) 2)) ;; bignum
              (write-long (ash (elt (_REcounter . bv) 0) 0) s)
              (write-long (ash (elt (_REcounter . bv) 1) -1) s))
             ((and (class _REcounter) (= (length (_REcounter . bv)) 1)) ;; big1
              (write-long (elt (_REcounter . bv) 0) s)
              (write-long (if (>= _REcounter 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _REcounter s)(write-long (if (>= _REcounter 0) 0 #xffffffff) s)))
     ;; int64 _carrier
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _carrier (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _carrier) (= (length (_carrier . bv)) 2)) ;; bignum
              (write-long (ash (elt (_carrier . bv) 0) 0) s)
              (write-long (ash (elt (_carrier . bv) 1) -1) s))
             ((and (class _carrier) (= (length (_carrier . bv)) 1)) ;; big1
              (write-long (elt (_carrier . bv) 0) s)
              (write-long (if (>= _carrier 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _carrier s)(write-long (if (>= _carrier 0) 0 #xffffffff) s)))
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
   ;; string _arrayTransfer
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _arrayTransfer (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _fileName
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _fileName (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _logFile
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _logFile (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _logHash
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _logHash (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _fileOrArray
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _fileOrArray (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _REcounter
#+(or :alpha :irix6 :x86_64)
      (setf _REcounter (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _REcounter (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _carrier
#+(or :alpha :irix6 :x86_64)
      (setf _carrier (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _carrier (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
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

(setf (get blockChainPack_::rewriteNode :md5sum-) "085590d527d397fa9632b68bed17ef19")
(setf (get blockChainPack_::rewriteNode :datatype-) "blockChainPack_/rewriteNode")
(setf (get blockChainPack_::rewriteNode :definition-)
      "string arrayTransfer
string fileName
string logFile
string logHash
string fileOrArray
int64 REcounter
int64 carrier
int64 done

")



(provide :blockChainPack_/rewriteNode "085590d527d397fa9632b68bed17ef19")


