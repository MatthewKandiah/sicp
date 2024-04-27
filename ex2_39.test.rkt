#lang racket

(require rackunit
		 "ex2_39.rkt")

(define x '(1 2 3 4 5 6 7 8 9))
(define y '(a b c d e f))
(define z '(0))

(check-equal? (reverse-r x) (reverse x))
(check-equal? (reverse-r y) (reverse y))
(check-equal? (reverse-r z) (reverse z))
(check-equal? (reverse-r '()) '())
(check-equal? (reverse-l x) (reverse x))
(check-equal? (reverse-l y) (reverse y))
(check-equal? (reverse-l z) (reverse z))
(check-equal? (reverse-l '()) '())
