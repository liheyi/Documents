(load "../Chapter_1/1.2/Example_4/fib_by_iteration.scm")
(load "2.2/Example_11/accumulate.scm")
(load "2.2/Example_11/enumerate-interval.scm")

(define (squares-of-fib-list n)
  (accumulate
	cons '() (map square (map fib (enumerate-interval 0 n)))))
