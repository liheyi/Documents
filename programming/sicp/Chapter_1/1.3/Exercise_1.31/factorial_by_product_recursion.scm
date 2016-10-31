(load "1.3/Exercise_1.31/product_by_recursion.scm")

(define (identity x) x)
(define (inc n) (+ n 1))
(define (factorial b)
  (product identity 1 inc b))
