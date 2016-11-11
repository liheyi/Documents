(load "2.2/Example_11/accumulate.scm")
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))
