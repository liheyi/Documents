(load "../Chapter_1/1.2/Example_7/gcd_by_Euclid_Algorithm.scm")

(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d))))
    (if (< d 0)
      (cons (- (/ n g)) (- (/ d g)))
      (cons (/ n g) (/ d g)))))

(define (numer x) (car x))
(define (denom x) (cdr x))
