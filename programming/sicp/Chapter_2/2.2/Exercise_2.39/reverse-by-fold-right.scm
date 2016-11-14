(load "2.2/Exercise_2.38/fold-right.scm")
(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))
