(load "1.3/product_by_iteration.scm")

(define (identity x) x)
(define (inc n) (+ n 1))

(define (factorial b)
  (product identity 1 inc b))
