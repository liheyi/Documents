(define (divides a b) (= (remainder a b) 0))

(define (find_divisor n test_divisor)
  (cond ((> (square test_divisor) n) n)
        ((divides n test_divisor) test_divisor)
        (else (find_divisor n (+ test_divisor 1)))
  )
)

(define (smallest_divisor n) 
  (find_divisor n 2)
)
