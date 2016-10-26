(define (average x y) (/ (+ x y) 2))
(define (improve guess x) (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;;The define of new-if
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause) (else else-clause)))

;;The define of sqrt-iter used by new-if
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

(define (square-root x) (sqrt-iter 1.0 x))
