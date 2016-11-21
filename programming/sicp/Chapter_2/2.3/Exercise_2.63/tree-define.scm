(define tree-a 
  (make-tree 7
             (make-tree 3
                        (make-tree 1 '() '())
                        (make-tree 5 '() '()))
             (make-tree 9
                        '()
                        (make-tree 11 '() '()))))

(define tree-b
  (make-tree 3
             (make-tree 1 '() '())
             (make-tree 7
                        (make-tree 5 '() '())
                        (make-tree 9
                                   '()
                                   (make-tree 11 '() '())))))

(define tree-c
  (make-tree 5
             (make-tree 3
                        (make-tree 1 '() '())
                    	'())
             (make-tree 9
                        (make-tree 7 '() '())
                        (make-tree 11 '() '()))))
