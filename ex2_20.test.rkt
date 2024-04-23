#lang racket

(require rackunit
		 "ex2_20.rkt")

(check-equal? (same-parity 1 2 3 4 5 6 7 8 9) '(1 3 5 7 9) "keep odds")
(check-equal? (same-parity 0 2 3 4 5 6 7 8 9) '(0 2 4 6 8) "keep odds")
