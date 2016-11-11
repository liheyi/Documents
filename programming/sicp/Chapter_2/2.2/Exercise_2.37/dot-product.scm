(load "2.2/Example_11/accumulate.scm")
(define (dot-product v w)
  (accumulate + 0 (map * v w)))
