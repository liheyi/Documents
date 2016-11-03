(load "1.3/Exercise_1.43/repeated_by_recursion")
(load "1.3/Example_14/average_damp.scm")
(define (average-damp-n-times f n)
  ((repeated average-damp n) f))
