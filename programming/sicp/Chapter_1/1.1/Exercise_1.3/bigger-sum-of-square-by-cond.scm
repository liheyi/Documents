(load "sum-of-square.scm")

(define (bigger-sum-of-square-by-cond x y z) 
  (cond ((and (> x y) (> y z)) (sum-of-square x y))
        ((and (> x y) (> z y)) (sum-of-square x z))
        ((and (> y x) (> x z)) (sum-of-square y x))
        ((and (> y x) (> z x)) (sum-of-square y z))))
