#lang racket

(define (enumerate-interval low high)
  (if (> low high)
	'()
	(cons low (enumerate-interval (+ 1 low) high))))

(define (enumerate-interval-iter low high)
  (define (iter x out)
	(if (> x high)
	  out
	  (iter (+ 1 x) (cons x out))))
  (reverse (iter low '())))

(provide enumerate-interval
		 enumerate-interval-iter)
