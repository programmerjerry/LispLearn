(defun my-gcd (p q)
  (if (= q 0)
      p
    (my-gcd q (mod p q))))
