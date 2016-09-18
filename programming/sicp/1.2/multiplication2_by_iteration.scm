(define (double n) (* n 2))

(define (halve n) (/ n 2))

(define (even n)
    (= (remainder n 2) 0)
)

(define (fast_mul_iter a counter SUM)
  (cond ((= counter 0) SUM)
        ((even counter) (fast_mul_iter (double a) (halve counter) SUM))
        (else (fast_mul_iter a (- counter 1) (+ a SUM)))
  )
)

(define (fast_mul a b)
  (fast_mul_iter a b 0)
)
