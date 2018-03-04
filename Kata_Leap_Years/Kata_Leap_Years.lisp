(defun kata-leap-years-p (n)
  (cond ((zerop (mod n 400)) t)
        ((and
          (zerop (mod n 4))
          (not (zerop (mod n 100)))) t)
        nil))