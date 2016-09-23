(define (prime n)
  (define (smallest_divisor n) 
    (define (find_divisor n test_divisor)
      (define (divides a b) (= (remainder a b) 0))
      (define (next n)
        (define (odd n) (= (remainder n 2) 1))
        (if (odd n) (+ n 2) (+ n 1)))
      (cond ((> (square test_divisor) n) n)
            ((divides n test_divisor) test_divisor)
            (else (find_divisor n (next test_divisor)))))
    (find_divisor n 2))
  (if (= n 1) #f (= n (smallest_divisor n))))
