(load "1.3/Example_16/newton_transform.scm")
(load "1.3/Example_16/fixed_point_of_transform.scm")
(define (square-root x)
  (fixed-point-of-transform
    (lambda (y) (- (square y) x)) newton-transform 1.0))
