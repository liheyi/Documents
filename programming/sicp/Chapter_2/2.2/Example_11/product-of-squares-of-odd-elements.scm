(load "2.2/Example_11/filter.scm")
(load "2.2/Example_11/accumulate.scm")

(define (product-of-squares-of-odd-elements sequence)
  (accumulate * 1 (map square (filter odd? sequence))))
