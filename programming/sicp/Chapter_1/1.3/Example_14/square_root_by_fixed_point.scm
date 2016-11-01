(load "1.3/Example_13/fixed_point_of_function.scm")
(load "1.3/Example_14/average_damp.scm")
(define (square-root x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))
