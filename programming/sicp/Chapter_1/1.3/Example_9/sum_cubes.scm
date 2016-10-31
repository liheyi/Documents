(load "1.3/Example_9/sum_by_recursion.scm")

(define (cube x) (* x x x))
(define (inc n) (+ n 1))

(define (sum-cubes a b)
  (sum cube a inc b))
