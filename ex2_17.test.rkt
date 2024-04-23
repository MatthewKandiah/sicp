#lang racket

(require rackunit
		 "ex2_17.rkt")

(check-equal? (last-pair (list 23 72 149 34)) (list 34) "book example")
(check-equal? (last-pair '()) '() "empty list")
(check-equal? (last-pair '(a)) '(a) "simgle element list")
(check-equal? (last-pair '('(a b c) '(d e f) '(g h i))) '('(g h i)) "nested lists")
