;;;; 7. Reverse Integer
;;;; 反转整型数字，如果是123，反转后是321；-123反转后是-321
;;;; 其它语言需要考虑整型的溢出，对于lisp，规范里面定义的整型是数学上的整数，
;;;; 不用考虑溢出，这是使用lisp比较幸福的地方
;;;; 解决办法：正数，转成字符串后反转，然后转成数字；负数，取绝对值后，
;;;; 转成字符串，然后反转字符串，再转成数组乘上-1

(defun Reverse-Integer (n)
  (let ((result ""))
    (if (> n 0)
        (setf result (parse-integer (reverse (write-to-string n))))
      (setf result 
            (* -1 (parse-integer (reverse (write-to-string (abs n)))))))
    result))


;;; CL-USER 614 > (Reverse-Integer 123)
;;; 321

;;; CL-USER 615 > (Reverse-Integer -123)
;;; -321

;;; CL-USER 616 > (Reverse-Integer 1000000003)
;;; 3000000001

;;; CL-USER 617 > (Reverse-Integer -1000000003)
;;; -3000000001
