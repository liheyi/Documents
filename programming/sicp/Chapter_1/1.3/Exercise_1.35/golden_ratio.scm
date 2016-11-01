(load "1.3/Example_13/fixed_point_of_function.scm")

(define golden-ratio
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))
