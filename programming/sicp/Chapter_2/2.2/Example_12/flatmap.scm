(load "2.2/Example_11/accumulate.scm")
(define (flatmap proc sequence)
  (accumulate append '() (map proc sequence)))
