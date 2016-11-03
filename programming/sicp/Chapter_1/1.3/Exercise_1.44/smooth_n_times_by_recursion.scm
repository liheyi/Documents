(load "1.3/Exercise_1.44/smooth.scm")
(define (smooth-n-times f n)
  (if (= n 0) f (smooth (smooth-n-times f (- n 1)))))
