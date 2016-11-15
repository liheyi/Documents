(define (iter-check row-of-new-queen rest-of-queens i)
  (if (null? rest-of-queens) #t
    (let ((row-of-current-queen (car rest-of-queens)))
      (if (or (= row-of-new-queen row-of-current-queen)
              (= row-of-new-queen (+ i row-of-current-queen))
              (= row-of-new-queen (- row-of-current-queen i)))
        #f
        (iter-check row-of-new-queen (cdr rest-of-queens) (+ i 1))))))

(define (safe k position)
  (iter-check (car position) (cdr position) 1))
