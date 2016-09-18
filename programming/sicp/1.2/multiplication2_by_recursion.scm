(define (double n) (* n 2))

(define (halve n) (/ n 2))

(define (even n)
  (= (remainder n 2) 0)
)

(define (fast_mul a b)
  (cond ((= b 0) 0)
        ((even b) (double (fast_mul a (halve b))))
        (else (+ a (fast_mul a (- b 1))))
  )
)
