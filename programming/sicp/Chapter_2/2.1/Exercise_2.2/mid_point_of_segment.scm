(load "2.1/Exercise_2.2/point_repr.scm")
(load "2.1/Exercise_2.2/segment_repr.scm")
(load "2.1/Exercise_2.2/mid_point_rule.scm")

(define (midpoint-segment seg)
  (let ((start (start-segment seg))
        (end (end-segment seg)))
    (make-point (average (x-point start) (x-point end))
                (average (y-point start) (y-point end)))))
