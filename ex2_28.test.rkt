#lang racket

(require rackunit
		 "ex2_28.rkt")

(check-equal? (fringe '()) '() "empty tree edge case")
(check-equal? (fringe 'a) '(a) "single element")
(check-equal? (fringe '((a b c) ((d e) (f g)))) '(a b c d e f g) "nested lists")
