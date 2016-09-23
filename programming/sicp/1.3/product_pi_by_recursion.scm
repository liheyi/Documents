(load "1.3/product_by_recursion.scm")

(define (pi-next n) (+ n 2))
(define (pi-term a)
  ( * 1.0 (/ (* a (pi-next a)) (square (+ a 1)))))

(define (product-pi a b)
  (product pi-term a pi-next b))
