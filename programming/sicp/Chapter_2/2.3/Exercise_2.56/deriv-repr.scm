;;
;; Constructors
;;

;; Construct the sum of a1 and a2
(define (make-sum a1 a2)
  (cond ((is-number? a1 0) a2)
        ((is-number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

;; Construct the product of m1 and m2
(define (make-product m1 m2)
  (cond ((is-number? m1 1) m2)
        ((is-number? m2 1) m1)
        ((or (is-number? m1 0) (is-number? m2 0)) 0)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))


;;
;; Selectors
;;

;; Addend of the sum s
(define (addend s) (cadr s))

;; Augend of the sum s
(define (augend s) (caddr s))

;; Multiplier of the product p
(define (multiplier p) (cadr p))

;; Multiplicand of the product p
(define (multiplicand p) (caddr p))

;;
;; Predicates
;;

;; Is num number?
(define (is-number? expression num)
  (and (number? expression) (= expression num)))

;; Is x variable?
(define (variable? x) (symbol? x))

;; Are v1 and v2 the same variable?
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

;; Is x a sum?
(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

;; Is x a product?
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

;; START NEWLINES
(define (make-exponentiation base exponent)
  (cond ((= exponent 0) 1)
        ((= exponent 1) base)
        (else (list '** base exponent))))

(define (is-exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base expression) (cadr expression))

(define (exponent expression) (caddr expression))
;; END NEWLINES

