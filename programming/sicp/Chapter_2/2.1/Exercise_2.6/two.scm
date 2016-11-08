;;one 
(define one
  (lambda (f)
    (lambda (x)
      (f x))))

;;add-1
(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f (
          (n f)
         x)))))

;;two
(add-1 one)

(lambda (f)
  (lambda (x)
    (f
      ((one f)
       x))))

(lambda (f)
  (lambda (x)
    (f (
        ((lambda (f)
           (lambda (x)
             (f x)))
         f)
        x))))

(lambda (f)
  (lambda (x)
    (f (
        (lambda (x)
          (f x))
       x))))

(lambda (f)
  (lambda (x)
    (f (f x))))

;;
;;two的定义
;;
(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))
