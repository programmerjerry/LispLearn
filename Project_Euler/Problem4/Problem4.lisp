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
       (max-len 0) ; 记录最大的回文的长度
       (result nil)) ; 记录回文
      ((= n1 1) result)
    (do ((n2 n (- n2 1)))
        ((= n2 1))     
      (let* ((prod (* n1 n2))
             (len (length (write-to-string prod))))
        (if (is-palindrome prod)
            ; 是回文的话，长度比已经记录的长，则这个是新的最长的回文
            (if (> len max-len)
                (progn
                  (setf result prod)
                  (setf max-len len))))))))


;;; CL-USER 53 > (largest-palindrome-product 999)
;;; 580085
