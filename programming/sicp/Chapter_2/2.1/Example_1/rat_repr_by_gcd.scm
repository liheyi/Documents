(load "../Chapter_1/1.2/Example_7/gcd_by_Euclid_Algorithm.scm")

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(define (numer x) (car x))
(define (denom x) (cdr x))
