(define (nontrivial-square-root? a n)
  (and (not (= a 1))
       (not (= a (- n 1)))
       (= 1 (remainder (square a) n))))

(define (expmod base expt m)
  (cond ((= expt 0) 1)
        ((nontrivial-square-root? base m) 0)
        ((even? expt) (remainder (square (expmod base (/ expt 2) m)) m))
        (else (remainder (* base (expmod base (- expt 1) m)) m))))

(define (non-zero-random n)
  (let ((r (random n)))
     (if (not (= r 0)) r
         (non-zero-random n))))

(define (test-iter n times)
  (cond ((= times 0) #t)
        ((= (expmod (non-zero-random n) (- n 1) n) 1)
         (test-iter n (- times 1)))
        (else #f)))

(define (Miller-Rabin-test n)
  (let ((times (ceiling (/ n 2))))
     (test-iter n times)))
