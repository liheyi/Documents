(define (make-mobile left right)
  (cons left right))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))
