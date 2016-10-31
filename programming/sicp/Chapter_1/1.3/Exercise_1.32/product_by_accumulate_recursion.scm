(load "1.3/Exercise_1.32/accumulate_by_recursion.scm")

(define (product term a next b)
  (accumulate * 1 term a next b))
