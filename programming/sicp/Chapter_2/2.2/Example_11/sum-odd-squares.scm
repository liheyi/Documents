(load "2.2/Example_11/filter.scm")
(load "2.2/Example_11/accumulate.scm")
(load "2.2/Example_11/enumerate-tree.scm")

(define (sum-odd-squares tree)
  (accumulate + 0 (map square (filter odd? (enumerate-tree tree)))))
