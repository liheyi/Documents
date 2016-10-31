(load "1.3/Exercise_1.31/product_by_recursion.scm")

(define (product-pi a b)
  (define (pi-next n) (+ n 2))
  (define (pi-term a)
    ( * 1.0 (/ (* a (pi-next a)) (square (+ a 1)))))
  (product pi-term a pi-next b))
