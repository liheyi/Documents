(load "1.3/accumulate_by_iteration.scm")

(define (product term a next b)
  (accumulate * 1 term a next b))
