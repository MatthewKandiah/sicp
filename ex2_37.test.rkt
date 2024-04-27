#lang racket

(require rackunit
		 "ex2_37.rkt")

(define v1 '(1 0))
(define v2 '(0 1))

(define mx '((0 1) (1 0)))
(define my '((0 -i) (+i 0)))
(define mz '((1 0) (0 -1)))
(define id '((1 0) (0 1)))

(check-equal? (matrix-*-vector mx v1) '(0 1))
(check-equal? (matrix-*-vector mx v2) '(1 0))
(check-equal? (matrix-*-vector my v1) '(0 +i))
(check-equal? (matrix-*-vector my v2) '(-i 0))
(check-equal? (matrix-*-vector mz v1) '(1 0))
(check-equal? (matrix-*-vector mz v2) '(0 -1))
(check-equal? (matrix-*-vector id v1) '(1 0))
(check-equal? (matrix-*-vector id v2) '(0 1))

(check-equal? (transpose mx) mx)
(check-equal? (transpose my) '((0 +i) (-i 0)))
(check-equal? (transpose mz) mz)
(check-equal? (transpose id) id)

(check-equal? (matrix-*-matrix mx mx) id)
(check-equal? (matrix-*-matrix my my) id)
(check-equal? (matrix-*-matrix mz mz) id)
(check-equal? (matrix-*-matrix id id) id)
(check-equal? (matrix-*-matrix mx my) (scalar-*-matrix +i mz))
(check-equal? (matrix-*-matrix my mz) (scalar-*-matrix +i mx))
(check-equal? (matrix-*-matrix mz mx) (scalar-*-matrix +i my))
(check-equal? (matrix-*-matrix id mx) mx)
(check-equal? (matrix-*-matrix mx id) mx)
(check-equal? (matrix-*-matrix id my) my)
(check-equal? (matrix-*-matrix my id) my)
(check-equal? (matrix-*-matrix id mz) mz)
(check-equal? (matrix-*-matrix mz id) mz)

(define id3 '((1 0 0) (0 1 0) (0 0 1)))
(define m3 '((1 2 3) (4 5 6) (7 8 9)))
(check-equal? (matrix-*-matrix id3 m3) m3)
(check-equal? (matrix-*-matrix m3 id3) m3)
