#lang racket

(require "accumulate.rkt")

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length seq)
  (accumulate (lambda (_ y) (+ 1 y)) 0 seq))

(provide map
		 append
		 length)
