(load "1.3/Example_13/fixed_point_of_function.scm")
(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))
