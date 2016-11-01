(define (smallest-divisor n) 
  (define (find-divisor n test-divisor)
    (define (divides? a b) (= (remainder b a) 0))
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (find-divisor n 2))

(define (prime? n) 
  (if (= n 1) #f
      (= n (smallest-divisor n))))
