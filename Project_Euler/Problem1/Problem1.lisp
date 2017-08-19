;;;; Problem 1 Multiples of 3 and 5
;;; 1000以内，能被3或者5整除的自然数, 求这些自然数的和
(defun sum-of-multiple-3-5 (n)
  (let ((result 0))
    (dotimes (i n)
      (if (or
           (zerop (mod i 3))
           (zerop (mod i 5)))
          (setf result (+ result i))))
    result))
