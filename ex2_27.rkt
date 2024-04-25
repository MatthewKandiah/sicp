#lang racket

(define (deep-reverse-rec lst)
  (cond ([null? lst] '())
		([not (pair? (car lst))] (append (deep-reverse-rec (cdr lst)) (list (car lst))))
		(else (append (deep-reverse-rec (cdr lst)) (list (deep-reverse-rec (car lst)))))))

(define (deep-reverse-iter lst)
  (define (iter in out)
	(cond ([null? in] out)
		  ([not (pair? (car in))] (iter (cdr in) (cons (car in) out)))
		  (else (iter (cdr in) (cons (deep-reverse-iter(car in)) out)))))
  (iter lst '()))

(provide deep-reverse-rec
		 deep-reverse-iter)
