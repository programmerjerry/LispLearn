(defun binary-search (key list)
  (let ((lo 0) (hi (1- (length list))))
    (do ((mid (truncate (+ lo (/ (- hi lo) 2.0)))
              (truncate (+ lo (/ (- hi lo) 2.0)))))
        ((> lo hi) mid)
      (cond ((< key (nth mid list))(setf hi (1- mid)))
            ((> key (nth mid list))(setf lo (1+ mid)))
            (t (return-from binary-search mid))))
    nil))
