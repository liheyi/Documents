(define (scale-list items factor)
  (map (lambda (x) (* x factor)) items))
