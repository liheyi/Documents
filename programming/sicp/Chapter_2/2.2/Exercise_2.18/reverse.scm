(define (reverse items)
  (define (iter remained-items result)
    (if (null? remained-items) result
        (iter (cdr remained-items)
              (cons (car remained-items) result))))
  (iter items '()))
