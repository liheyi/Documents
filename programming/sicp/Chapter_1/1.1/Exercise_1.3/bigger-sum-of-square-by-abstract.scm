(load "1.1/Exercise_1.3/sum-of-square.scm")
(load "1.1/Exercise_1.3/bigger-and-smaller.scm")

(define (bigger-sum-of-square-by-abstract x y z)
  (sum-of-square (bigger x y) (bigger (smaller x y) z)))
