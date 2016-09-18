(define (mul_iter a counter SUM)
  (if (= counter 0)
      SUM
      (mul_iter a
               (- counter 1)
               (+ a SUM)
      )
  )
)

(define (mul a b)
  (mul_iter a b 0)
)
