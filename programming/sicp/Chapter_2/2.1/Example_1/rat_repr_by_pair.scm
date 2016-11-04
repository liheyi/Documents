;; Another way to define the selectors and constructor
;;
;; (define make-rat cons)
;; (define numer car)
;; (define denom cdr)

(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))
