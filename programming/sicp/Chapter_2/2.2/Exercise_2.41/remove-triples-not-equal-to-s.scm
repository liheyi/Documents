(load "2.2/Exercise_2.41/unique-triples.scm")
(load "2.2/Exercise_2.41/triple-sum-equal-to-s.scm")
(define (remove-triples-not-equal-to-s s triple)
  (filter (lambda (current-triple)
            (triple-sum-equal-to-s s current-triple))
          triple))
