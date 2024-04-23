#lang racket

(define (reverse lst)
  (define (iter in out)
	(if (null? in)
	  out
	  (iter (cdr in) (cons (car in) out))))
  (iter lst '()))

(provide reverse)
