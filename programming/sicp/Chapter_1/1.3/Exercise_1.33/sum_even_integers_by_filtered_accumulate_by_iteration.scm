(load "1.3/Exercise_1.33/filtered_accumulate_by_iteration.scm")

(define (identity x) x)
(define (inc n) (+ n 1))
(define (sum-even-integers n)
  (filtered-accumulate + 0 identity 1 inc n even?))
