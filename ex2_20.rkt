#lang racket

(define (same-parity x . lst)
  (define keep?
	(if (even? x) even? odd?))
  (define (iter in out)
	(cond ([null? in] out)
		  ([keep? (car in)] (iter (cdr in) (cons (car in) out)))
		  (else (iter (cdr in) out))))
  (cons x (reverse (iter lst '()))))

(provide same-parity)
