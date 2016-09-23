(define (filtered-accumulate combine null-value term a next b valid)
  (if (> a b) null-value
      (if (valid a)
         (combine (term a)
                  (filtered-accumulate combine
                                       null-value
                                       term
                                       (next a)
                                       next
                                       b
                                       valid))
        (filtered-accumulate combine
       	                     null-value
       	                     term
       	                     (next a)
       	                     next
       	                     b
       	                     valid))))
