(load "2.1/Exercise_2.2/segment_repr.scm")
(load "2.1/Exercise_2.2/point_repr.scm")

;;
;; rectangle constructor
;;
(define (make-rectangle length-1 length-2 width-1 width-2)
  (cons (cons length-1 length-2) (cons width-1 width-2)))

;;
;; rectangle selectors
;; 
(define (length-1-rectangle r)
  (car (car r)))

(define (length-2-rectangle r)
  (cdr (car r)))

(define (width-1-rectangle r)
  (car (cdr r)))

(define (width-2-rectangle r) 
  (cdr (cdr r)))

;;
;; length of rectangle
;;
(define (length-of-rectangle r)
  (let ((length (length-1-rectangle r)))
    (let ((start (start-segment length))
          (end (end-segment length)))
      (- (x-point end) (x-point start)))))

;;
;; width of rectangle
;;
(define (width-of-rectangle r)
  (let ((width (width-1-rectangle r)))
    (let ((start (start-segment width))
          (end (end-segment width)))
      (- (y-point end) (y-point start)))))
