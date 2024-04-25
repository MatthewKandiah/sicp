#lang racket

(define (make-branch len structure)
  (list len structure))

(define (branch-length b)
  (car b))

(define (branch-structure b)
  (cadr b))

(define (branch-weight b)
  (let
      ([structure (branch-structure b)])
    (if (number? structure)
        structure
        (mobile-weight structure))))

(define (make-mobile left right)
  (list left right))

(define (mobile-left m)
  (car m))

(define (mobile-right m)
  (cadr m))

(define (mobile-weight m)
  (+ (branch-weight (mobile-left m)) (branch-weight (mobile-right m))))

(provide
 make-branch
 branch-length
 branch-structure
 branch-weight
 make-mobile
 mobile-left
 mobile-right
 mobile-weight
 )
