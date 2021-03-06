(load "2.2/Example_11/enumerate-interval.scm")
(load "2.2/Example_12/flatmap.scm")
(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))
