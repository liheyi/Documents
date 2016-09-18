(define (mul a b)
  (if (= b 0)
      0
      (+ a (mul a (- b 1)))
  )
)
