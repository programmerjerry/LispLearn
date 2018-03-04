;;;; Problem 9 Special Pythagorean triplet
;;;; 求满足条件的a、b、c的乘积，条件：a<b<c;a^2+b^2=c^2;a+b+c=1000
;;;; 直接根据条件挨个尝试即可，运算量不大很快就跑出来了


(defun special-pythagorean-triplet ()
  (dotimes (a 1001)
    (dotimes (b 1001)
      (dotimes (c 1001)
        (if (and (< a b) (< b c))
            (if (= (+ a b c) 1000)
                (if (=
                     (+ (expt a 2) (expt b 2))
                     (expt c 2))
                    (return-from special-pythagorean-triplet (* a b c)))))))))


;;; CL-USER 72 > (special-pythagorean-triplet)
;;; 31875000
