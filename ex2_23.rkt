#lang racket

(define (for-each proc items)
  (cond ([null? items] (void))
		(else 
		  (proc (car items))
		  (for-each proc (cdr items))
		  )))
