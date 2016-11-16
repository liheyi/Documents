(define (make-sum a1 . a2)
  (if (single-operand? a2)
    (let ((a2 (car a2)))
      (cond ((is-number? a1 0) a2)
            ((is-number? a2 0) a1)
            ((and (number? a1) (number? a2)) (+ a1 a2))
            (else (list '+ a1 a2))))
    (cons '+ (cons a1 a2))))

(define (addend s) (cadr s))

(define (augend s)
  (let ((tail-operand (cddr s)))
    (if (single-operand? tail-operand)
        (car tail-operand)
        (apply make-sum tail-operand))))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
