(define (search_for_primes n)
  (define (search_consecutive_prime n count)
    (define (next_odd n)
      (define (odd n) (= (remainder n 2) 1))
      (if (odd n) (+ n 2) (+ n 1)))

    (define (fast_prime n times)
      (define (expmod base expo m)
        (define (even n) (= (remainder n 2) 0))
        (cond ((= expo 0) 1)
              ((even expo)
               (remainder
                 (square (expmod base (/ expo 2) m))
                 m))
              (else
               (remainder
            	 (* base (expmod base (- expo 1) m))
            	 m))))
      (define (fermat_test n)
        (define (try_it a) (= (expmod a n n) a))
        (try_it (+ 1 (random (- n 1)))))
      (cond ((= times 0) true)
            ((fermat_test n) (fast_prime n (- times 1)))
            (else false)))
    
    (cond ((= count 0) (display "are primes."))
          ((fast_prime n 1000)
           (display n)
           (newline)
           (search_consecutive_prime (next_odd n) (- count 1)))
          (else (search_consecutive_prime (next_odd n) count))))


  (let ((start_time (real-time-clock)))
		(search_consecutive_prime n 3)
	   (- (real-time-clock) start_time)))
