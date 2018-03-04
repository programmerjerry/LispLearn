;;;; 6. ZigZag Conversion
;;;; 将字符串中的字符逐个按之字形放到多行，然后按行拼成新的字符串，求这个新的
;;;; 字符串
;;;; 解决办法：建立一个二位数组，将字符串放到数组的下标对应的单元里面
;;;; 如果列的与行数nRows减1的模是0，则填充整列；如果行和列的和与nRows减1的
;;;; 模是0，则填充之字的斜线

;;; 0 0                  0 3                    0 6
;;; 1 0          1 2    1 3             1 5  1 6        1 8
;;; 2 0  2 1            2 3     2 4          2 6    2 7
;;; 3 0                   3 3                   3 6


(defun convert (text nRows)
  (let* ((fix-row nRows)
         (fix-col (length text)); 最坏的情况都在一行
        (my-arry (make-array  (list fix-row fix-col) :initial-element ""))
        (string-pos 0)
        (result ""))
    (do ((col 0 (+ col 1)))
        ((>= string-pos (- (length text) 1)) result)
      (dotimes (row nRows)
        (progn
          (if (or
               (zerop (mod col (1- nRows)))
               (and
                (not (zerop (mod col (1- nRows))))
                (zerop (mod (+ row col) (1- nRows)))))
              (progn
                (setf (aref my-arry row col)
                      (subseq text string-pos (1+ string-pos)))
                (setf string-pos (1+ string-pos))
                (if (> string-pos (- (length text) 1))
                    (return)))))))
    (dotimes (i fix-row)
      (dotimes (j fix-col)
      (setf result (concatenate 'string result (aref my-arry i j)))))
    result))


;;; CL-USER 564 > (convert "PAYPALISHIRING" 3)
;;; "PAHNAPLSIIGYIR"
