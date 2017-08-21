;;;; Problem 3 Largest prime factor
;;; 求一个数的最大的质数因子，也就是若干个不同的质数的乘积能得到这个数

;;; 判断是否是质数
(defun is-primer (n)
  ;; 1到n之间随机取一个数字，如果能被这个数整除，那么这个数一定不是质数，
  ;; 这个是使用的概率算法，如果运气好，能非常快判断出该数字是非质数；
  ;; 运气不好时，这里取该数字的一半作为最大的测试次数，如果还是没法判断不是
  ;; 质数，就根据质数的定义一个数字挨一个数字的判断是否能整除
  (dotimes (j (round (/ n 2.0)))
    (if (> j 2)
        (let ((r (random j)))
          (if (> r 1)
              (if (zerop (mod n r))
                  (return-from is-primer nil))))))
  ;; 根据质数定义判断是否是质数
  (let ((i 31)) ; 由于进入本函数前已经判断了该数字不能被2到29这些质数的质数整除了
    (loop while (<= i n)
          do (if (zerop (mod n i))
                 (if (= i n)
                     (return t)
                   (return nil)))
          (setf i (1+ i)))))

(defun largest-prime-factor (n)
  (let ((i (round (sqrt n)))) 
    (loop while (> i 1)
          do (;; 为了加快速度，先根据已知的质数做下整除判断
              if (and
                  (not (zerop (mod i 2))) 
                  (not (zerop (mod i 3)))
                  (not (zerop (mod i 5)))
                  (not (zerop (mod i 7)))
                  (not (zerop (mod i 11)))
                  (not (zerop (mod i 13)))
                  (not (zerop (mod i 17)))
                  (not (zerop (mod i 23)))
                  (not (zerop (mod i 27)))
                  (not (zerop (mod i 29)))
                  (not (zerop (mod n i)))
                  (is-primer1 i))
                 (return i))
          (setf i (- i 1)))))


;;; CL-USER 269 > (largest-prime-factor 600851475143)
;;; 775121
