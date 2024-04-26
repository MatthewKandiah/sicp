#lang racket

(require rackunit
		 "ex2_33.rkt")

(define x '(1 2 3 4 5))
(define (square x) (* x x))
(define (inc x) (+ 1 x))
(define (scale s) (lambda (x)(* s x)))

(check-equal? (map square x) '(1 4 9 16 25))
(check-equal? (map inc x) '(2 3 4 5 6))
(check-equal? (map (scale 3) x) '(3 6 9 12 15))

(define a '(1 2 3))
(define b '(a b c))
(check-equal? (append a b) '(1 2 3 a b c))
(check-equal? (append b a) '(a b c 1 2 3))

(check-equal? (length x) 5)
(check-equal? (length a) 3)
(check-equal? (length '()) 0)
