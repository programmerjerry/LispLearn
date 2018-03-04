(defclass MyDate ()
  ((year :initarg :y)
   (month :initarg :m)
   (day :initarg :d)))


;;; CL-USER 1 > (defparameter *my-date* (make-instance 'MyDate :y 2017 :m 11 :d 15))
;;; *MY-DATE*

;;; CL-USER 2 > *my-date*
;;; #<MYDATE 402012D67B>

;;; CL-USER 3 > (describe *my-date*)

;;; #<MYDATE 402012D67B> is a MYDATE
;;; YEAR       2017
;;; MONTH      11
;;; DAY        15