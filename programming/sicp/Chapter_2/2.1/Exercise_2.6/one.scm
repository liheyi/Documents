;;重写zero的定义
(define zero
  (lambda (f)
    (lambda (x)
      x)))

;;重写add-1的定义
(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f
        ((n f) 
         x)))))
;;展开
(add-1 zero)

(lambda (f)
  (lambda (x)
    (f
      ((zero f)
       x))))

(lambda (f)
  (lambda (x)
    (f (
        ((lambda (f)
          (lambda (x) x))
        f)
       x))))

(lambda (f)
  (lambda (x)
    (f (
      (lambda (x) x))
       x)))

(lambda (f)
  (lambda (x)
    (f x)))

;;
;;one的定义
;;
(define one
  (lambda (f)
    (lambda (x)
      (f x))))
