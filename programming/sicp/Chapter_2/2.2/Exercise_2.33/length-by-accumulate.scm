(load "2.2/Example_11/accumulate.scm")
(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
