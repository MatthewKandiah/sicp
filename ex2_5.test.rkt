#lang racket

(require rackunit
		 "ex2_5.rkt")

(check-equal? (num-cons 0 0) 1 "cons 0 . 0")
(check-equal? (num-cons 1 0) 2 "cons 1 . 0")
(check-equal? (num-cons 0 1) 3 "cons 0 . 1")
(check-equal? (num-cons 2 3) 108 "cons 2 . 3")

(check-equal? (num-car (num-cons 0 0)) 0 "car 0 . 0")
(check-equal? (num-car (num-cons 1 0)) 1 "car 1 . 0")
(check-equal? (num-car (num-cons 0 1)) 0 "car 0 . 1")
(check-equal? (num-car (num-cons 2 3)) 2 "car 2 . 3")
(check-equal? (num-car (num-cons 23 32)) 23 "car 23 . 32")

(check-equal? (num-cdr (num-cons 0 0)) 0 "cdr 0 . 0")
(check-equal? (num-cdr (num-cons 1 0)) 0 "cdr 1 . 0")
(check-equal? (num-cdr (num-cons 0 1)) 1 "cdr 0 . 1")
(check-equal? (num-cdr (num-cons 2 3)) 3 "cdr 2 . 3")
(check-equal? (num-cdr (num-cons 23 32)) 32 "cdr 23 . 32")

