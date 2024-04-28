#lang racket

(require rackunit
		 "ex2_42.rkt")

(check-equal? (length (queens 1)) 1)
(check-equal? (length (queens 2)) 0)
(check-equal? (length (queens 3)) 0)
(check-equal? (length (queens 4)) 2)
(check-equal? (length (queens 5)) 10)
(check-equal? (length (queens 6)) 4)
(check-equal? (length (queens 7)) 40)
(check-equal? (length (queens 8)) 92)
(check-equal? (length (queens 9)) 352)
(check-equal? (length (queens 10)) 724)
(check-equal? (length (queens 11)) 2680)
(check-equal? (length (queens 12)) 14200)

