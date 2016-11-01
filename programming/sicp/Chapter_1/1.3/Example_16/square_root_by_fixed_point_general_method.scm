(load "1.3/Example_14/average_damp.scm")
(load "1.3/Example_16/fixed_point_of_transform.scm")
(define (square-root x)
  (fixed-point-of-transform
    (lambda (y) (/ x y)) average-damp 1.0))
