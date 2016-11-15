(load "2.2/Example_12/prime-sum.scm")
(load "2.2/Example_12/make-pair-sum.scm")
(load "2.2/Exercise_2.40/unique-pairs.scm")
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum (unique-pairs n))))
