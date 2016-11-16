(define (make-product m1 m2)
  (cond ((is-number? m1 1) m2)
        ((is-number? m2 1) m1)
        ((or (is-number? m1 0) (is-number? m2 0)) 0)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))
