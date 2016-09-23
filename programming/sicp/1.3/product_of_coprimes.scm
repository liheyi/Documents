(load "1.3/filtered_accumulate_by_recursion.scm")
(load "1.2/gcd_by_Euclid_Algorithm.scm")

(define (identity x) x)
(define (coprime a b) (and (< a b) (= 1 (gcd a b))))
(define (inc n) (+ n 1))

(define (product-of-coprimes n)
  (filtered-accumulate * 1 identity 1 inc n (lambda (x) (coprime x n))))
