(load "2.2/Exercise_2.28/fringe.scm")
(load "2.2/Example_11/accumulate.scm")

(define (count-leaves tree)
  (accumulate (lambda (current-leave remianed-leaves-count)
                (+ 1 remianed-leaves-count))
              0
              (fringe tree)))
