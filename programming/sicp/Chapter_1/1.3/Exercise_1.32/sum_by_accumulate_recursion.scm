(load "1.3/Exercise_1.32/accumulate_by_recursion.scm")

(define (sum term a next b)
  (accumulate + 0 term a next b))
