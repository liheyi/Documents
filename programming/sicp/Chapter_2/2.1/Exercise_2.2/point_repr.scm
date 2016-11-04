;; point constructor
(define (make-point x y) (cons x y))

;; point selector
(define (x-point p) (car p))
(define (y-point p) (cdr p))
