#lang racket

(define (reverse lst)
  (define (iter in out)
	(if (null? in)
	  out
	  (iter (cdr in) (cons (car in) out))))
  (iter lst '()))

(define (reverse-rec lst)
  (if (null? lst)
	'()
	(append (reverse-rec (cdr lst)) (list (car lst)))))

(provide reverse
		 reverse-rec)
