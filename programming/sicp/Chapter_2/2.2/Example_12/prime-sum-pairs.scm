(load "2.2/Example_11/enumerate-interval.scm")
(load "2.2/Example_12/flatmap.scm")
(load "2.2/Example_12/prime-sum.scm")
(load "2.2/Example_12/make-pair-sum.scm")
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum (flatmap (lambda (i)
                                     (map (lambda (j) (list i j))
                                          (enumerate-interval 1 (- i 1))))
                                   (enumerate-interval 1 n)))))