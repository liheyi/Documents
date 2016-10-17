(load "../Example_3/factorial_by_iteration.scm")

(define (pascal row col)
  (cond ((< row col)
       (error "unvalid colum value."))
        (else (/ (factorial row)
    	         (* (factorial col) (factorial (- row col)))))))
