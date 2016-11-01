(load "1.3/Exercise_1.32/product_by_accumulate_recursion.scm")

(define (pi-next n) (+ n 2))
(define (pi-term a)
  (* 1.0 (/ (* a (pi-next a)) (square (+ a 1)))))
(define (product-pi a b)
  (product pi-term a pi-next b))
