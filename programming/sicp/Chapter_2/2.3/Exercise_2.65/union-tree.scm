(load "2.3/Exercise_2.63/tree-to-list-2.scm")
(load "2.3/Exercise_2.64/list-to-tree.scm")
(load "2.3/Exercise_2.62/union-set.scm")

(define (union-tree tree another)
  (list->tree
    (union-set (tree->list-2 tree)
               (tree->list-2 another))))
