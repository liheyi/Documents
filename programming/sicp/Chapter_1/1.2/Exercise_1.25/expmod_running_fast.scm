(define (expmod base expo m)
 (cond ((= expo 0) 1)
       ((even? expo)
        (remainder (square (expmod base (/ expo 2) m)) m))
       (else
        (remainder (* base (expmod base (- expo 1) m)) m))))
