;;;; leetcode 1 Two Sum
 
;;; 题目说明：从整型数组找到2个数字，它们的和等于目标数字，返回这2个数字在数组中的下标，假设输入的数组里面只能有一组符合条件的数字，数组下标从0开始。

;; 实现方法：list的第一个元素依次与这个元素后面的元素计算和，如果符合条件直接退出出
;; 否则，list的第二个元素依次与后面的元素计算和，直到找到符合条件的元素或者循环结束
(defun two-sum (nums-list target)
  (do* ((i 0 (+ i 1))
        (j (+ i 1) (+ j 1)))
       ((= i (1- (length nums-list))) nil)
    (if (= target
           (+
            (nth i nums-list)
            (nth j nums-list)))
        (return (list i j)))))


;;; CL-USER 173 > (two-sum '(2 2 11 15) 9)
;;; NIL

;;; CL-USER 174 > (two-sum '(2 7 11 15) 9)
;;; (0 1)
