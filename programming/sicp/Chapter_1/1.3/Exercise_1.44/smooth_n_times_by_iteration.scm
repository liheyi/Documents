(load "1.3/Exercise_1.44/smooth.scm")
(define (smooth-n-times f n)
  (define (iter i smoothed-f)
    (if (= i 0) smoothed-f
        (iter (- i 1) (smooth smoothed-f))))
  (iter n f))
