(load "1.3/Example_9/sum_by_recursion.scm")

(define (identity x) x)
(define (inc n) (+ n 1))

(define (sum-integers a b)
  (sum identity a inc b))
