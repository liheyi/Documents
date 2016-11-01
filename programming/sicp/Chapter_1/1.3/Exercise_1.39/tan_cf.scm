(load "1.3/Exercise_1.37/continued_fraction_by_iteration.scm")

(define (tan-cf x k)
  (define (N i) (if (= i 1) x (- (square x))))
  (define (D i) (- (* i 2) 1))
  (exact->inexact (cont-frac N D k)))
