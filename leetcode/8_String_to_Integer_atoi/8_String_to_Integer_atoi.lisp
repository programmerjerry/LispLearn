;;;; 8. String to Integer (atoi)
;;;; 将字符串形式的数字转换成整型
;;;; 解题思路: 根据字符表示的数字与字符0的差值的方式将字符形式的数字转换成整;;;;; 型; 注意要测试边界条件:正号开始的、符号开始的、没有符号的整型
;;;; 除了第一个位置外，含义非数字的情况，例如:+123.4 这种情况不做转换

(defun 8_String_to_Integer_atoi (str)
  (let ((result 0))
    (cond ((equal (subseq str 0 1) "-") ; 负号开始的
           (dotimes (i (1- (length str)))
             (let* ((s (char str (1+ i)))
                    (diff-result (- (char-code s) (char-code #\0))))
               (if (or
                    (> diff-result 9)
                    (< diff-result 0))
                   (return-from 8_string_to_integer_atoi nil)
                 (setf result (+
                               (* result 10)
                               diff-result)))))
           (return-from 8_string_to_integer_atoi (* result -1)))
          ((equal (subseq str 0 1) "+") ; 正号开始的
           (dotimes (i (1- (length str)))
             (let* ((s (char str (1+ i)))
                    (diff-result (- (char-code s) (char-code #\0))))
               (if (or
                    (> diff-result 9)
                    (< diff-result 0))
                   (return-from 8_string_to_integer_atoi nil)
                 (setf result (+
                               (* result 10)
                               (- (char-code s) (char-code #\0)))))))
           (return-from 8_string_to_integer_atoi result))
          (t (dotimes (i (length str)) ; 其它情况
               (let* ((s (char str i))
                      (diff-result (- (char-code s) (char-code #\0))))
                 (if (or
                      (> diff-result 9)
                      (< diff-result 0))
                     (return-from 8_string_to_integer_atoi nil)
                   (setf result (+
                                 (* result 10)
                                 (- (char-code s) (char-code #\0)))))))
             (return-from 8_string_to_integer_atoi result)))))


;;; CL-USER 764 > (8_string_to_integer_atoi "-321")
;;; -321

;;; CL-USER 765 > (8_string_to_integer_atoi "+321")
;;; 321

;;; CL-USER 766 > (8_string_to_integer_atoi "000321")
;;; 321

;;; CL-USER 767 > (8_string_to_integer_atoi "-32.1")
;;; NIL