#lang racket

(require rackunit)

(define x (list 1 2 3))
(define y (list 4 5 6))

(check-equal? (append x y) '(1 2 3 4 5 6) "append")
(check-equal? (cons x y) '((1 2 3) 4 5 6) "cons")
(check-equal? (list x y) '((1 2 3) (4 5 6)) "list")

