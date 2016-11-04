;; segment constructor
(define (make-segment start-point end-point)
  (cons start-point end-point))

;; segment selector
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))
