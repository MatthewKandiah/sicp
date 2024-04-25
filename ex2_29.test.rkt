#lang racket

(require rackunit
		 "ex2_29.rkt")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; test data											  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define branch-flat1 (make-branch 1 2))
(define branch-flat2 (make-branch 3 4))
(define branch-simple-mobile
  (make-branch 5 (make-mobile branch-flat1 branch-flat2)))
(define branch-nested-mobile
  (make-branch 6 (make-mobile branch-flat1 branch-simple-mobile)))
(define mobile-flat (make-mobile branch-flat1 branch-flat2))
(define mobile-nested-left (make-mobile branch-nested-mobile branch-flat1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; branch selectors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(check-equal? (branch-length branch-flat1) 1)
(check-equal? (branch-structure branch-flat1) 2)
(check-equal? (branch-length branch-flat2) 3)
(check-equal? (branch-structure branch-flat2) 4)
(check-equal? (branch-structure branch-simple-mobile)
			  (make-branch branch-flat1 branch-flat2))
(check-equal? (branch-structure branch-nested-mobile)
			  (make-mobile branch-flat1 branch-simple-mobile))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mobile selectors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(check-equal? (mobile-left mobile-flat) branch-flat1)
(check-equal? (mobile-right mobile-flat) branch-flat2)
(check-equal? (mobile-left mobile-nested-left) branch-nested-mobile)
(check-equal? (mobile-right mobile-nested-left) branch-flat1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; branch-weight
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(check-equal? (branch-weight branch-flat1) 2)
(check-equal? (branch-weight branch-simple-mobile) 6)
(check-equal? (branch-weight branch-nested-mobile) 8)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mobile-weight
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(check-equal? (mobile-weight mobile-flat) 6)
(check-equal? (mobile-weight mobile-nested-left) 10)
