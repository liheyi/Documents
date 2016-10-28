(define (carmichael n)
  (define (car-iter a n)
    (define (congruent a n)
      (define (expmod base expo m)
        (define (even n) (= (remainder n 2) 0))
        (cond ((= expo 0) 1)
              ((even expo)
               (remainder
                 (square (expmod base (/ expo 2) m)) m))
              (else
               (remainder
                 (* base (expmod base (- expo 1) m)) m))))
      (= (expmod a n n) a))
    (cond ((= a n) #t)
          ((congruent a n)
           (car-iter (+ a 1) n))
          (else #f)))
  (car-iter 1 n))
