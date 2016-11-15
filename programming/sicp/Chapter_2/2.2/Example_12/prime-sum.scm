(load "../Chapter_1/1.2/Example_8/prime_by_search_divisor.scm")
(define (prime-sum pair)
  (prime? (+ (car pair) (cadr pair))))
