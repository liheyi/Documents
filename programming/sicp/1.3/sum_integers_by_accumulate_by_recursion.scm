(load "1.3/sum_by_accumulate_by_recursion.scm")

(define (identity x) x)
(define (inc n) (+ n 1))

(define (sum-integers a b)
  (sum identity a inc b))
