(load "2.2/Exercise_2.38/fold-left.scm")
(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))
