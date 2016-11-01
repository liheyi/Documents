(load "1.3/Exercise_1.33/filtered_accumulate_by_iteration.scm")
(load "1.2/Example_8/prime_by_search_divisor.scm")

(define (inc n) (+ n 1))
(define (cube x) (* x x x))
(define (sum-prime a b)
  (filtered-accumulate + 0 cube a inc b prime?))
