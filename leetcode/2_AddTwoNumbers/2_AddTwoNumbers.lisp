;;;; 2. Add Two Numbers


;;; list转成字符串
(defun convert-list-to-string (str-list)
  (let ((result ""))
    (dolist (e str-list)
      (let ((tmp (concatenate 'string result (write-to-string e))))
        (setf result tmp)))
    result))
    
;;; 整型转换成list
(defun convert-integer-to-list (n)
  (let* ((str (write-to-string n)) (result nil))
    (dotimes (i (length str))
      (push (parse-integer (subseq str i (1+ i)))  result))
    result))


(defun add-two-numbers (list1 list2)
  (let ((str1 (convert-list-to-string (reverse list1)))
        (str2 (convert-list-to-string (reverse list2)))
        (prod 0)
        (result nil))
    (setf prod (+
                (parse-integer str1)
                (parse-integer str2)))
    (setf result (convert-integer-to-list prod))
    result))


;;; CL-USER 305 > (add-two-numbers '(2 4 3) '(5 6 4))
;;; (7 0 8)
