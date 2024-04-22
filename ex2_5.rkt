#lang racket

(define (pow base exp)
  (define (iter result cnt)
    (if (= cnt 0)
        result
        (iter (* result base) (- cnt 1))))
  (iter 1 exp))

(define (num-cons a b)
  (* (pow 2 a) (pow 3 b)))

(define (eliminate-factor n factor)
  (let([reduced (/ n factor)])
    (if (integer? reduced)
	  (eliminate-factor reduced factor)
	  n)))

(define (find-exponent n base)
  (define (iter x cnt)
	(if (= x 1)
	  cnt
	  (iter (/ x base) (+ cnt 1))))
  (iter n 0))

(define (num-car n)
  (find-exponent (eliminate-factor n 3) 2))

(define (num-cdr n)
  (find-exponent (eliminate-factor n 2) 3))
