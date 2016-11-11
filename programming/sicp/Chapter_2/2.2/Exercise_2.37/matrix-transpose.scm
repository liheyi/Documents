(load "2.2/Exercise_2.36/accumulate-n.scm")
(define (transpose m)
  (accumulate-n cons '() m))
