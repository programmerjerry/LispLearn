;;;; 9. Palindrome Number
;;;; 判断一个数字是否是回文(题目有个特殊要求是不占用额外的空间，含义有点模糊
;;;; 我的理解是不创建其它的变量)

(defun is-palindrome (n)
  (equal
   (write-to-string n)
   (reverse (write-to-string n))))


;;; CL-USER 834 > (is-palindrome 123321)
;;; T

;;; CL-USER 835 > (is-palindrome -123321)
;;; NIL

;;; CL-USER 836 > (is-palindrome 3333333333333333333333333333333123321)
;;; NIL

;;; CL-USER 837 > (is-palindrome 3333333333333333333333333333333)
;;; T