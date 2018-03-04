;;;; Problem 7 10001st prime
;;;; 求第10001个质数

;;;; 解决办法：从1开始挨个测试是否是质数，由于 除了2以外的质数都是奇数，
;;;; 只要挨个测试奇数是否是质数就可以了。用了1分27秒，还可以接受。

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

  ;; 先用一些已知的质数测试下是否能整除，如果能整除则是非质数
  (if (or
       (zerop (mod n 2))
       (zerop (mod n 3))
       (zerop (mod n 5))
       (zerop (mod n 7))
       (zerop (mod n 11))
       (zerop (mod n 13))
       (zerop (mod n 17))
       (zerop (mod n 19))
       (zerop (mod n 23))
       (zerop (mod n 29))
       (zerop (mod n 31))
       (zerop (mod n 37)))
      (return-from is-primer nil))
       

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
  (let ((i 2)) ; 这里直接从2开始
    (loop while (<= i n)
          do (if (zerop (mod n i))
                  (if (= i n)
                      (return t)
                    (return nil)))
          (setf i (1+ i)))))

(defun 10001st-prime (n)
  (let ((j 3) (i 2))
    (loop while (<= i n) ;需要算上第n个质数
          do (if (is-primer j)
                 (setf i (1+ i)))
          (setf j (+ j 2)))
    (- j 2))) ; 循环里面多加了2，需要减掉


;;; CL-USER 47 > (10001st-prime 10001)
;;; 104743
