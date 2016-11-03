(load "1.3/Exercise_1.40/cubic.scm")
(load "1.3/Exercise_1.40/newton_method.scm")
(define (zero-of-cubic a b c)
  (newtons-method (cubic a b c) 1.0))
