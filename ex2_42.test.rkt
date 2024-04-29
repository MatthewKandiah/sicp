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

;; taking advantage of an implementation detail, my solutions always generate in descending order by column so we can check an example without handling the 
(define (contains? elem lst)
  (cond [(null? lst) #f]
		[(equal? elem (car lst)) #t]
		[else (contains? elem (cdr lst))]))

(define book-example-solution
  '((8 3) (7 5) (6 8) (5 4) (4 1) (3 7) (2 2) (1 6)))

(check-true (contains? book-example-solution (queens 8)))
