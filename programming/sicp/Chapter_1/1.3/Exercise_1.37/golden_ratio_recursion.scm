(load "1.3/Exercise_1.37/continued_fraction_by_recursion.scm")
(define (golden-ratio k)
  (+ 1
     (cont-frac (lambda (i) 1.0)
                (lambda (i) 1.0)
                k)))
