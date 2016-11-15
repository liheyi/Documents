(define (triple-sum-equal-to-s s triple)
  (= s (fold-right + 0 triple)))
