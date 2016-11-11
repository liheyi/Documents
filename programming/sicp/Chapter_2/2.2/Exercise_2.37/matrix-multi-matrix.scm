(load "2.2/Exercise_2.37/dot-product.scm")
(load "2.2/Exercise_2.37/matrix-transpose.scm")

(define (matrix-*-matrix m n)
  (map (lambda (row-of-m)
         (map (lambda (col-of-n)
                (dot-product row-of-m col-of-n))
              (transpose n)))
       m))
