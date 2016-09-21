(define (fast_prime n times)

; (define (expmod base expo m)
;   (define (even n) (= (remainder n 2) 0))
;   (cond ((= expo 0) 1)
;         ((even expo)
;          (remainder
;            (square (expmod base (/ expo 2) m))
;            m))
;          (else
;           (remainder
;             (* base (expmod base (- expo 1) m))
;             m))))

  (define (expmod base expo m)
	(define (fast_expt b n)
	  (define (fast_expt_iter b n a)
		(define (even n) (= (remainder n 2) 0))
		(cond ((= n 0) a)
			  ((even n)
			   (fast_expt_iter (square b) (/ n 2) a))
			  (else (fast_expt_iter b (- n 1) (* b a)))))
	  (fast_expt_iter b n 1))
    (remainder (fast_expt base expo) m))

  (define (fermat_test n)
    (define (try_it a) (= (expmod a n n) a))
    (try_it (+ 1 (random (- n 1)))))

  (cond ((= times 0) true)
        ((fermat_test n) (fast_prime n (- times 1)))
        (else false)))

