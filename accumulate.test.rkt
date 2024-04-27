#lang racket

(require rackunit
		 "accumulate.rkt")

;; accuulate should do the same thing as foldr

(define x '(1 2 3 4 5))
(define y '(6 7 8 9))

(check-equal? (accumulate + 0 x) 15)
(check-equal? (accumulate + 0 x) (foldr + 0 x))
(check-equal? (accumulate + 0 y) (foldr + 0 y))
;; if `op` is commutative, foldl and foldr should be the same
(check-equal? (accumulate + 0 x) (foldl + 0 x))
(check-equal? (accumulate + 0 y) (foldl + 0 y))

(define square (lambda (x) (* x x)))
(define (map-helper p) (lambda (x y) (cons (p x) y)))

(check-equal? (accumulate (map-helper square) '() x) '(1 4 9 16 25))
(check-equal? (accumulate (map-helper square) '() x) (foldr (map-helper square) '() x))
(check-equal? (accumulate (map-helper square) '() y) (foldr (map-helper square) '() y))
;; in this case `op` is not commutative, so we expect `foldl` to give a different result
(check-not-eq? (accumulate (map-helper square) '() x) (foldl (map-helper square) '() x))

