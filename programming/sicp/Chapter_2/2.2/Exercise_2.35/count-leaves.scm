(load "2.2/Example_11/accumulate.scm")
(define (count-leaves tree)
  (accumulate +
              0
              (map (lambda (sub-tree)
                     (if (pair? sub-tree) 
                         (count-leaves sub-tree)
                         1))
            	   tree)))
