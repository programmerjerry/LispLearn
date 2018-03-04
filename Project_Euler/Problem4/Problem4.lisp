;;;;Problem 4 Largest palindrome product
;;;; 求2个三位数字的乘积构成的最大的回文


;;; 判断是否是回文，只要将字符串和反转后的一致就是回文
(defun is-palindrome (n)
  (let ((s (write-to-string n)))
    (if (equalp s (reverse s))
        t
      nil)))

(defun largest-palindrome-product (n)
  (do ((n1 n (- n1 1))
       (result 0)) ; 记录回文
      ((= n1 1) result)
    (do ((n2 n (- n2 1)))
        ((= n2 1))     
      (let* ((prod (* n1 n2)))
        (if (is-palindrome prod)
            ; 如果是回文并且新的值比记录的最大值大，，则这个是新的最大的回文
            (if (> prod result)
                  (setf result prod)))))))


;;; CL-USER 82 > (largest-palindrome-product 999)
;;; 906609
