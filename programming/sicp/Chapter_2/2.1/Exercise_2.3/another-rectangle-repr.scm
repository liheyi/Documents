(load "2.1/Exercise_2.2/segment_repr.scm")
(load "2.1/Exercise_2.2/point_repr.scm")

;;
;; rectangle constructor
;;
(define (make-rectangle length width)
  (cons length width))

;;
;; rectangle selectors
;;
(define (length-rectangle r)
  (car r))

(define (width-rectangle r)
  (cdr r))

;;
;; length of rectangle
;;
(define (length-of-rectangle r)
  (let ((length (length-rectangle r)))
    (let ((start (start-segment length))
          (end (end-segment length)))
      (- (x-point end) (x-point start)))))

;;
;; width of rectangle
;;
(define (width-of-rectangle r)
  (let ((width (width-rectangle r)))
    (let ((start (start-segment width))
          (end (end-segment width)))
      (- (y-point end) (y-point start)))))
