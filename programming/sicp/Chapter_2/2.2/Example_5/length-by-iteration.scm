(define (length items)
  (define (iter a count)
    (if (null? a) count
        (iter (cdr a) (+ 1 count))))
  (iter items 0))
