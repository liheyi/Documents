(define (smallest_divisor n) 

  (define (find_divisor n test_divisor)
    (define (divides a b) (= (remainder a b) 0))
    (cond ((> (square test_divisor) n) n)
          ((divides n test_divisor) test_divisor)
          (else (find_divisor n (+ test_divisor 1)))))

  (find_divisor n 2)
)
