(define (fib_iter a b count)
  (if (= count 0)
      b
      (fib_iter (+ a b) a (- count 1))
  )
)

(define (fib n)
  (fib_iter 1 0 n)
)
