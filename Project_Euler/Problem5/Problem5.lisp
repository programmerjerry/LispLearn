;;;; Problem 5 Smallest multiple
;;;;求1到20的最小公倍数

;;;;实现方案：1到20所有数字做乘积，会得到一个公倍数，但是不是最小的公倍数
;;;; 用这个数字依次去整除1到20之间的质数，每个质数做多次整除并测试得到的商是否
;;;; 满足公倍数.如果不满足，则用最后满足条件的商，去多次除以下一个质数并
;;;; 测试商是否满足公倍数的条件。最后会获得最小公倍数。

;;; 测试数字是否是1到n的公倍数
(defun is-evenly-divisible-by-all-of-the-numbers (n smallest-multiple)
  (do ((i 1 (+ i 1)))
      ((> i n))
    (unless (zerop (mod smallest-multiple i))
      (return-from is-evenly-divisible-by-all-of-the-numbers nil)))
  t)


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
  (let ((i 2)) ; 除了2外的质数都不是偶数，这里直接从3开始
    (loop while (<= i n)
          do (if (zerop (mod n i))
                  (if (= i n)
                      (return t)
                    (return nil)))
          (setf i (1+ i)))))

;;; 获得最小公倍数
(defun smallest-multiple (n)
  (let ((result 1) (primer-list nil))
    ;; 获得1到n的乘积
    (do ((i 1 (+ i 1)))
        ((> i n))
      (progn
        (if (is-primer i) ; 获得1到n之间的所有质数
            (push i primer-list))
        (setf result (* result i))))
    
    (dolist (v1 primer-list)
      (if (zerop (mod result v1))
          (loop while (is-evenly-divisible-by-all-of-the-numbers n result)
               do (let ((new-value (/ result v1)))
                  (if (is-evenly-divisible-by-all-of-the-numbers n new-value)
                      (setf result new-value)
                    (return result))))))
    result))


;;; CL-USER 24 > (smallest-multiple 20)
;;; 232792560
