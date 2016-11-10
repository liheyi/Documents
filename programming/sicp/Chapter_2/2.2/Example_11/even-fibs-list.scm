(load "../Chapter_1/1.2/Example_4/fib_by_iteration.scm")
(load "2.2/Example_11/filter.scm")
(load "2.2/Example_11/accumulate.scm")
(load "2.2/Example_11/enumerate-tree.scm")

(define (even-fibs n)
  (accumulate
   cons '() (filter even? (map fib (enumerate-interval 0 n)))))
