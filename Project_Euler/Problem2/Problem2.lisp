;;;; Project Euler Problem 2 Even Fibonacci numbers

;;; 最大值不超过4百万的斐波那契数列，求所有偶数的斐波那契数之和
(defun sum-even-fib (max-value)
  (let ((result 2) (fib1 1) (fib2 2))
    (dotimes (i max-value)
      (let ((next-fib (+ fib1 fib2)))
        (if (evenp next-fib)
            (setf result (+ result next-fib)))
        (if (> next-fib max-value)
            (return result))
        (setf fib1 fib2)
        (setf fib2 next-fib)))))

;;; CL-USER 227 > (sum-even-fib 4000000)
;;; 4613732
