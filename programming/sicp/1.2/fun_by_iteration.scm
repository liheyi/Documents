(define (f_iter a b c count)
  (if (= count 1)
	b
	(f_iter (+ a (* 2 b) (* 3 c)) a b (- count 1))
  )
)

(define (f n)
  (f_iter 2 1 0 n)
)
