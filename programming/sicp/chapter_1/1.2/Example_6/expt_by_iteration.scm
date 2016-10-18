(define (expt b n)
  (define (expt-iter b product counter )
    (if (= counter 0) product
        (expt-iter b (* b product) (- counter 1))))
  (expt-iter b 1 n))
