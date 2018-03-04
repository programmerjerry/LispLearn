;;;; Problem 6 Sum square difference
;;;; 求1到100的和的平方与1到100平方的和的差

;;; 平方的和
(defun sum-of-squares (n)
    (let ((result 0))
        (dotimes (i n)
          (setf result (+ result (expt (1+ i) 2))))
        result))

;;; 和的平方
(defun square-of-sum (n)
  (let ((result 0))
    (dotimes (i n)
      (setf result (+ result (1+ i))))
    (setf result (expt result 2))
    result))

;;; 求差
(defun difference-sumofsquares-squareofsum (n)
  (- (square-of-sum n) (sum-of-squares n)))


;;; CL-USER 34 > (difference-sumofsquares-squareofsum 100)
;;; 25164150
