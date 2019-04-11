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
  :slots (_carrierID _order _counter ))

(defmethod blockChainPack_::finish
  (:init
   (&key
    ((:carrierID __carrierID) 0)
    ((:order __order) 0)
    ((:counter __counter) 0)
    )
   (send-super :init)
   (setq _carrierID (round __carrierID))
   (setq _order (round __order))
   (setq _counter (round __counter))
   self)
  (:carrierID
   (&optional __carrierID)
   (if __carrierID (setq _carrierID __carrierID)) _carrierID)
  (:order
   (&optional __order)
   (if __order (setq _order __order)) _order)
  (:counter
   (&optional __counter)
   (if __counter (setq _counter __counter)) _counter)
  (:serialization-length
   ()
   (+
    ;; int64 _carrierID
    8
    ;; int64 _order
    8
    ;; int64 _counter
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _carrierID
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _carrierID (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _carrierID) (= (length (_carrierID . bv)) 2)) ;; bignum
              (write-long (ash (elt (_carrierID . bv) 0) 0) s)
              (write-long (ash (elt (_carrierID . bv) 1) -1) s))
             ((and (class _carrierID) (= (length (_carrierID . bv)) 1)) ;; big1
              (write-long (elt (_carrierID . bv) 0) s)
              (write-long (if (>= _carrierID 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _carrierID s)(write-long (if (>= _carrierID 0) 0 #xffffffff) s)))
     ;; int64 _order
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _order (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _order) (= (length (_order . bv)) 2)) ;; bignum
              (write-long (ash (elt (_order . bv) 0) 0) s)
              (write-long (ash (elt (_order . bv) 1) -1) s))
             ((and (class _order) (= (length (_order . bv)) 1)) ;; big1
              (write-long (elt (_order . bv) 0) s)
              (write-long (if (>= _order 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _order s)(write-long (if (>= _order 0) 0 #xffffffff) s)))
     ;; int64 _counter
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _counter (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _counter) (= (length (_counter . bv)) 2)) ;; bignum
              (write-long (ash (elt (_counter . bv) 0) 0) s)
              (write-long (ash (elt (_counter . bv) 1) -1) s))
             ((and (class _counter) (= (length (_counter . bv)) 1)) ;; big1
              (write-long (elt (_counter . bv) 0) s)
              (write-long (if (>= _counter 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _counter s)(write-long (if (>= _counter 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _carrierID
#+(or :alpha :irix6 :x86_64)
      (setf _carrierID (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _carrierID (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _order
#+(or :alpha :irix6 :x86_64)
      (setf _order (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _order (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _counter
#+(or :alpha :irix6 :x86_64)
      (setf _counter (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _counter (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(setf (get blockChainPack_::finish :md5sum-) "1efba28662379f734d4ad8a51cd40130")
(setf (get blockChainPack_::finish :datatype-) "blockChainPack_/finish")
(setf (get blockChainPack_::finish :definition-)
      "int64 carrierID
int64 order
int64 counter

")



(provide :blockChainPack_/finish "1efba28662379f734d4ad8a51cd40130")


