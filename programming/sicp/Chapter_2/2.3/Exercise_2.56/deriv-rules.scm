(load "2.3/Exercise_2.56/deriv-repr.scm")

(define (deriv expression var)
  (cond ((number? expression) 0)
        ((variable? expression) (if (same-variable? expression var) 1 0))
        ((sum? expression) (make-sum (deriv (addend expression) var)
                                     (deriv (augend expression) var)))
        ((product? expression)
         (make-sum
           (make-product (multiplier expression)
                         (deriv (multiplicand expression) var))
           (make-product (deriv (multiplier expression) var)
                         (multiplicand expression))))
        ;; START NEWLINES
        ((is-exponentiation? expression)
         (let ((n (exponent expression))
               (u (base expression)))
           (make-product n (make-product (make-exponentiation u (- n 1))
                                         (deriv u var)))))
        ;; END NEWLINES
        (else
          (error "Unknown expression type: DERIV" expression))))
