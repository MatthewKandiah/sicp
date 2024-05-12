#lang racket

(require rackunit)

(define (make-function)
  (let ([stored-value '()])
    (lambda (x)
      (cond [(not (equal? stored-value 0))
             (set! stored-value x)
             (display stored-value)])
      stored-value)))

(define f1 (make-function))
(define f2 (make-function))
(check-equal? (+ (f1 0) (f1 1)) 0)
(check-equal? (+ (f2 1) (f2 0)) 1)
