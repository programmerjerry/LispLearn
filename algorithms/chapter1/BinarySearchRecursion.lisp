(defun binary-search-rec (key list)
  (if (or
       (> key (nth (1- (length list)) list))
       (< key (nth 0 list)))
      nil
    (binary-search-recursion key list 0 (length list))))

(defun binary-search-recursion (key list lo hi)
  (if (> lo hi)
      nil
    (let ((mid (+ lo (truncate (/ (- hi lo) 2)))))
      (cond ((< key (nth mid list))
             (binary-search-recursion key list lo (- mid 1)))
            ((> key (nth mid list))
             (binary-search-recursion key list (+ mid 1) hi))
            (t mid)))))