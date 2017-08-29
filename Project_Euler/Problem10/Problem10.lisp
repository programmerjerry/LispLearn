;;;; Problem 10 Summation of primes
;;;; 求1到2百万之间的所有质数的和

;;; 判断是否是质数
(defun is-primer (n)
  (let ((i 2))
    (loop while (<= i (round (sqrt n))) ; 计算到n的平方根就可以了
          do (if (zerop (mod n i))
                 (if (= i n)
                     (return-from is-primer t)
                   (return-from is-primer nil)))
          (setf i (+ i 1)))) ; max-primer 到了这里肯定是奇数
  t)


(defun summation-of-primes (n)
  (let ((result 2))
    (do ((i 3 (+ i 2))) ; 除了2，质数都是奇数
        ((>= i n) result)
      (if (is-primer i)
          (setf result (+ result i))))
    result))
       

;;; CL-USER 277 > (summation-of-primes 2000000)
;;; 142913828922
