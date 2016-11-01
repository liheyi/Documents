(load "1.3/Example_9/sum_by_recursion.scm")

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (factor k)
    (cond ((or (= k 0) (= k n)) 1)
          ((odd? k) 4)
          (else 2)))
  (define (term k) (* (factor k) (y k)))
  (define (next k) (+ k 1))
  (if (not (even? n))
      (error "n can't be odd number.")
      (* (/ h 3) (sum term (exact->inexact 0) next n))))