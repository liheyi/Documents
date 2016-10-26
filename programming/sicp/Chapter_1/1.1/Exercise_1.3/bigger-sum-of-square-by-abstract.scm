(load "sum-of-square.scm")
(load "bigger-and-smaller.scm")

(define (bigger-sum-of-square-by-abstract x y z)
  (sum-of-square (bigger x y) (bigger (smaller x y) z)))
