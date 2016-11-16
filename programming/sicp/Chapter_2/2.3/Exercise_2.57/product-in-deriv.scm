(define (make-product m1 . m2)
  (if (single-operand? m2)
    (let ((m2 (car m2)))
      (cond ((or (is-number? m1 0) (is-number? m2 0)) 0)
            ((is-number? m1 1) m2)
            ((is-number? m2 1) m1)
            ((and (number? m1) (number? m2)) (* m1 m2))
            (else (list '* m1 m2))))
    (cons '* (cons m1 m2))))

(define (multiplier p) (cadr p))

(define (multiplicand p)
  (let ((tail-operand (cddr p)))
    (if (single-operand? tail-operand)
        (car tail-operand)
        (apply make-product tail-operand))))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

