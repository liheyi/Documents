(load "2.2/Example_11/accumulate.scm")
(define (append seq1 seq2)
  (accumulate cons seq2 seq1))
