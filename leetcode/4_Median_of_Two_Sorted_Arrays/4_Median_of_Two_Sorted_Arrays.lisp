;;;; 4. Median of Two Sorted Arrays
;;;; 题目:2个有序数组的中位数
;;;; 实现方法:2个有序数组做合并，然后根据总的长度是奇数还是偶数取中位数字.
;;;; 奇数，最中间的那个数字;偶数，取中间的2个数字的平均数


(defun 4_Median_of_Two_Sorted_Arrays (list1 list2)
  (let* ((len (+ (length list1) (length list2)))
         (median-pos (ceiling (/ len 2)))
         (pos1 0)
         (pos2 0)
         (tmp-list nil))
    (dotimes (i len)
      (let ((num1 (nth pos1 list1)) (num2 (nth pos2 list2)))
        (cond ((null num2)
               (progn
                 (setf tmp-list
                       (append (reverse (subseq list1 pos1))
                               tmp-list))
                 (return)))
              ((null num1)
               (progn
                 (setf tmp-list
                       (append (reverse (subseq list2 pos2)) 
                               tmp-list))
                 (return)))
              (t (if (<  num1 num2)
                     (progn
                       (push num1 tmp-list)
                       (setf pos1 (1+ pos1)))
                   (progn
                     (push num2 tmp-list)
                     (setf pos2 (1+ pos2))))))))
    (if (oddp len)
        (return-from 4_Median_of_Two_Sorted_Arrays
          (nth (1- median-pos) (reverse tmp-list)))
      (return-from 4_Median_of_Two_Sorted_Arrays
        (/ (+ (nth (1- median-pos) (reverse tmp-list))
              (nth median-pos (reverse tmp-list))) 2.0)))))


;;; CL-USER 436 > (4_Median_of_Two_Sorted_Arrays '(1 3) '(2))
;;; 2

;;; CL-USER 437 > (4_Median_of_Two_Sorted_Arrays '(1 3) '(2 5))
;;; 2.5
