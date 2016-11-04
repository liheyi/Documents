(load "2.1/Exercise_2.2/print_point.scm")
(define (print-rectangle r)
  (let ((L1 (length-1-rectangle r))
        (L2 (length-2-rectangle r))
        (W1 (width-1-rectangle r))
        (W2 (width-2-rectangle r)))

    (newline)
    (display "Length 1:")
    (print-point (start-segment L1))
    (print-point (end-segment L1))
    
    (newline)
    (display "Length 2:")
    (print-point (start-segment L2))
    (print-point (end-segment L2))
    
    (newline)
    (display "Width 1:")
    (print-point (start-segment W1))
    (print-point (end-segment W1))
    
    (newline)
    (display "Width 2:")
    (print-point (start-segment W2))
    (print-point (end-segment W2))))