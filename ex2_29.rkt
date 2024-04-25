#lang racket

(define (make-branch len structure)
  (cons len structure))

(define (branch-length b)
  (car b))

(define (branch-structure b)
  (cdr b))

(define (branch-weight b)
  (let
      ([structure (branch-structure b)])
    (if (number? structure)
        structure
        (mobile-weight structure))))

(define (branch-balanced? b)
  (let
      ([structure (branch-structure b)])
    (if (number? structure)
        #t
        (mobile-balanced? structure))))

(define (branch-torque b)
  (* (branch-length b) (branch-weight b)))

(define (make-mobile left right)
  (cons left right))

(define (mobile-left m)
  (car m))

(define (mobile-right m)
  (cdr m))

(define (mobile-weight m)
  (+ (branch-weight (mobile-left m)) (branch-weight (mobile-right m))))

(define (mobile-balanced? m)
  (and
   (branch-balanced? (mobile-left m))
   (branch-balanced? (mobile-right m))
   (= (branch-torque (mobile-left m)) (branch-torque (mobile-right m)))))

(provide
 make-branch
 branch-length
 branch-structure
 branch-weight
 make-mobile
 mobile-left
 mobile-right
 mobile-weight
 mobile-balanced?
 )
