;;;; Problem 8 Largest product in a series
;;;; 题目要求：在1000个数字中找到n个连续的数字并且乘积是最大的
;;; 注意: 是找挨着的n个数字，而不是要求n个数字内部是连续的（例如：123、323）
;;; 例如:开始的5个数字73167 就是连续的5个数字


;;; 计算字符串中的一系列数字的乘积
(defun get-product-from-string (str)
  (let ((result 1))
    (dotimes (i (length str))
      (setf result (* result (parse-integer (subseq str i (1+ i))))))
    result))

  
(defun largest-product-in-a-series (n)
  (let ((s "73167176531330624919225119674426574742355349194934
96983520312774506326239578318016984801869478851843
85861560789112949495459501737958331952853208805511
12540698747158523863050715693290963295227443043557
66896648950445244523161731856403098711121722383113
62229893423380308135336276614282806444486645238749
30358907296290491560440772390713810515859307960866
70172427121883998797908792274921901699720888093776
65727333001053367881220235421809751254540594752243
52584907711670556013604839586446706324415722155397
53697817977846174064955149290862569321978468622482
83972241375657056057490261407972968652414535100474
82166370484403199890008895243450658541227588666881
16427171479924442928230863465674813919123162824586
17866458359124566529476545682848912883142607690042
24219022671055626321111109370544217506941658960408
07198403850962455444362981230987879927244284909188
84580156166097919133875499200524063689912560717606
05886116467109405077541002256983155200055935729725
71636269561882670428252483600823257530420752963450"))
    
 ;   (print s)
    (setf s (remove #\newline s)) ; 去掉回车换行符
  ;  (print s)
    (let ((max-product 0))
      (dotimes (i (- (length s) n))
        (let ((new-str (subseq s i (+ i n)))) ; 每次取5位
              (let ((new-product (get-product-from-string new-str))); 计算乘积
                (if (> new-product max-product)
                    (setf max-product new-product))))) ; 每次将最大的乘积保存
      max-product)))


;;; CL-USER 280 > (largest-product-in-a-series 13)
;;; 23514624000
