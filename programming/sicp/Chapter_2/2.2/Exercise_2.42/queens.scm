(load "2.2/Example_12/flatmap.scm")
(load "2.2/Example_11/enumerate-interval.scm")

(load "2.2/Exercise_2.42/empty-board.scm")
(load "2.2/Exercise_2.42/adjoin-position.scm")
(load "2.2/Exercise_2.42/safe.scm")

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0) (list empty-board)
        (filter
          (lambda (positions) (safe k positions))
          (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                     (adjoin-position new-row k rest-of-queens))
                   (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))
