;;;; Problem 3 Largest prime factor
;;; 求一个数的最大的质数因子，也就是若干个不同的质数的乘积能得到这个数

;;; 判断是否是质数
(defun is-primer (n)
  ;; 如果是一些已知的质数直接返回t
  (if (or
       (= n 2)
       (= n 3)
       (= n 5)
       (= n 7)
       (= n 11)
       (= n 13)
       (= n 17)
       (= n 19)
       (= n 23)
       (= n 29)
       (= n 31)
       (= n 37))
      (return-from is-primer t))

  ;; 1到n之间随机取一个数字，如果能被这个数整除，那么这个数一定不是质数，
  ;; 这个是使用的概率算法，如果运气好，能非常快判断出该数字是非质数；
  ;; 运气不好时，这里取该数字的一半作为最大的测试次数，如果还是没法判断不是
  ;; 质数，就根据质数的定义一个数字挨一个数字的判断是否能整除
  (dotimes (j (round (/ n 2.0)))
    (if (> j 2)
        (let ((r (random n)))
          (if (> r 1)
              (if (zerop (mod n r))
                  (return-from is-primer nil))))))

  ;; 根据质数定义判断是否是质数
  (let ((i 3)) ; 除了2外的质数都不是偶数，这里直接从3开始
    (loop while (<= i n)
          do (if (zerop (mod n i))
                  (if (= i n)
                      (return t)
                    (return nil)))
          (setf i (1+ i)))))

(defun largest-prime-factor (n)
  (let ((i (round (sqrt n)))) ; 质数因子的平方小于等于n，所以这里从平方根后的数字开始计算，按指数减少运算量
    (loop while (> i 2)
          do (if (and
                  (not (zerop (mod i 2))) ; 除了2以外的偶数都是非质数，能减少一半的计算量
                  (zerop (mod n i)) ; 必须是整除才行
                  (is-primer i))
                 (return i))
          (setf i (- i 1)))))


;;; CL-USER 49 > (largest-prime-factor 600851475143)
;;; 6857
