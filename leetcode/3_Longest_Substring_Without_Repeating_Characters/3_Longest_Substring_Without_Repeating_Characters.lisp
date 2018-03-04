;;;; 3. Longest Substring Without Repeating Characters
;;;; 解题思路:每次从大字符串里面取一个字符放到临时变量里面，如果新的字符在该临时变量里面，再测试该变量里面的字符串是否最长的，如果是记录最大长度；否则将该变量清空，将新的这个字符存放到变量里面，开始下一次

(defun 3_Longest_Substring_Without_Repeating_Characters (str)
  (let ((max-length 0) (tmp-str ""))
    (dotimes (i (length str))
      (let ((next-str (subseq str i (1+ i)))) ; 取下一个字符
        (if (not (find next-str tmp-str :test #'string=)) ; 测试下一个字符是否在已经截取的字符串里面
            (setf tmp-str (concatenate 'string tmp-str next-str)) ;不在就将这个新的字符拼接到截取的字符串里面
          (let ((len (length tmp-str))) ;如果已经截取的字符串里面存在该字符 
            (if (> len max-length); 新字符串是否是最长的
                (progn
                  (setf max-length len)))
            (setf tmp-str next-str))))) ; 下一组字串的第一个字符
    max-length))


;;; CL-USER 341 > (3_Longest_Substring_Without_Repeating_Characters "abcabcbb")
;;; 3

;;; CL-USER 342 > (3_Longest_Substring_Without_Repeating_Characters "bbbbb")
;;; 1

;;; CL-USER 343 > (3_Longest_Substring_Without_Repeating_Characters "pwwkew")
;;; 3
