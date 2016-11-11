(load "2.2/Exercise_2.37/matrix-transpose.scm")
(load "2.2/Exercise_2.37/matrix-multi-vector.scm")

(define (matrix-*-matrix m n)
  (let ((trans-n (transpose n)))
    (map (lambda (row-of-m)
           (matrix-*-vector trans-n row-of-m))
         m)))
