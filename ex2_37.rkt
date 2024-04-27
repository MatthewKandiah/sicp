#lang racket

(require "ex2_36.rkt")

(define (dot-product v w)
  (foldr + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map
   (lambda (x) (dot-product x v))
   m))

(define (transpose matrix)
  (accumulate-n
   (lambda (x y) (append (list x) y))
   '()
   matrix))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map
     (lambda (x)
       (map
        (lambda (y) (dot-product x y))
        cols))
     m)))

(define (scalar-*-matrix s m)
  (map
	(lambda (row)
	  (map
		(lambda (elem) (* s elem))
		row))
	m))

(provide matrix-*-vector
         transpose
         matrix-*-matrix
		 scalar-*-matrix)
