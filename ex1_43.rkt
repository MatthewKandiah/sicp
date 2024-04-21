#lang racket

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      (lambda (x) (f x))
      (compose f (repeated f (- n 1)))))

(define (square x)
  (* x x))

; expected result 625
((repeated square 2) 5)
