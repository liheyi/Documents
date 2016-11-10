(load "2.2/Exercise_2.29/mobile-repr.scm")
(load "2.2/Exercise_2.29/branch-repr.scm")

(define (hangs-another-mobile branch)
  (pair? (branch-structure branch)))

(define (branch-weight branch)
  (if (hangs-another-mobile branch)
      (total-weight (branch-structure branch))
      (branch-structure branch)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))
