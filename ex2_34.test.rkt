#lang racket

(require rackunit
		 "ex2_34.rkt")

(check-equal? (horner-eval 2 (list 1 3 0 5 0 1)) (+ 1 (* 3 2) (* 5 8) (* 1 32)))
(check-equal? (horner-eval 1 (list 1 3 0 5 0 1)) 10
