(load "1.3/Exercise_1.43/repeated_by_recursion")
(define (expt base n)
  (if (= n 0) 1 ((repeated (lambda (x) (* base x)) n) 1)))
