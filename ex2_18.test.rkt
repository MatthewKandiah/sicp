#lang racket

(require rackunit
		 "ex2_18.rkt")

(check-equal? (reverse '(1 4 9 16 25)) '(25 16 9 4 1) "book example")
(check-equal? (reverse '()) '() "empty list")
(check-equal? (reverse '(a)) '(a) "single element")
(check-equal? (reverse '('(a b c) '(d e) '(f))) '('(f) '(d e) '(a b c)) "list of lists")
