#lang racket

;; Return a list of ways to arrange n queens on an nxn board with no queens attacking each other
#|
Strategy:
  - Represent a board as a list of pairs, telling us the coordinates of all the queens placed on it
  - Pairs representing queen coords (x y): x in [1,n] tells us the column y in [1,n] tells us the row
|#
(define (queens n)
  (error "not done yet" n))

(provide queens)
