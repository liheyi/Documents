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
