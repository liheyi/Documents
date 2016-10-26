(define (search-for-primes n)
  
  (define (search-consecutive-prime n count)
	(define (next-odd n)
	  (if (odd? n) (+ n 2) (+ n 1)))

	(define (prime? n)
	  (define (find-divisor n test-divisor)
		(define (divides a b) (= (remainder a b) 0))
		(cond ((> (square test-divisor) n) n)
			  ((divides n test-divisor) test-divisor)
			  (else (find-divisor n (+ test-divisor 1)))))
	  (define (smallest-divisor n) (find-divisor n 2))
	  (= n (smallest-divisor n)))

	(cond ((= count 0) (display "are primes."))
		  ((prime? n)
		   (display n)
		   (newline)
		   (search-consecutive-prime (next-odd n) (- count 1)))
		  (else (search-consecutive-prime (next-odd n) count))))
  

  (let ((start-time (real-time-clock)))
        (search-consecutive-prime n 3)
       (- (real-time-clock) start-time)))
