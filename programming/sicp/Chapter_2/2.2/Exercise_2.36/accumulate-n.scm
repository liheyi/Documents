(load "2.2/Example_11/accumulate.scm")
(load "2.2/Exercise_2.36/car-n.scm")
(load "2.2/Exercise_2.36/cdr-n.scm")

(define (accumulate-n op init seqs)
  (if (null? (car seqs)) '()
      (cons (accumulate op init (car-n seqs))
            (accumulate-n op init (cdr-n seqs)))))
