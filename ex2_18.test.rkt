#lang racket

(require rackunit
		 "ex2_18.rkt")

(check-equal? (reverse-iter '(1 4 9 16 25)) '(25 16 9 4 1) "book example iter")
(check-equal? (reverse-iter '()) '() "empty list iter")
(check-equal? (reverse-iter '(a)) '(a) "single element iter")
(check-equal? (reverse-iter '('(a b c) '(d e) '(f))) '('(f) '(d e) '(a b c)) "list of lists iter")

(check-equal? (reverse-rec '(1 4 9 16 25)) '(25 16 9 4 1) "book example rec")
(check-equal? (reverse-rec '()) '() "empty list rec")
(check-equal? (reverse-rec '(a)) '(a) "single element rec")
(check-equal? (reverse-rec '('(a b c) '(d e) '(f))) '('(f) '(d e) '(a b c)) "list of lists rec")
