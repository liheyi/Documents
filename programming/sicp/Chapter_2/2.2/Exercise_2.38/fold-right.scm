; (load "2.2/Example_11/accumulate.scm")

(define (fold-right op initial sequence)
  (if (null? sequence) initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))
