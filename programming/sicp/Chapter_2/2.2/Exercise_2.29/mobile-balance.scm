(load "2.2/Exercise_2.29/branch-torque.scm")

(define (same-torque? left right)
  (= (branch-torque left)
     (branch-torque right)))

(define (branch-balance? branch)
  (if (hangs-another-mobile branch)
      (mobile-balance? (branch-structure branch))
      #t))

(define (mobile-balance? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and
      (same-torque? left right)
      (branch-balance? left)
      (branch-balance? right))))
