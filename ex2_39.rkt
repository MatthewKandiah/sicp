#lang racket

(define (reverse-r lst)
  (foldr (lambda (head rest) (append rest (list head))) '() lst))

(define (reverse-l lst)
  (foldl (lambda (tail rest) (cons tail rest)) '() lst))

(provide reverse-r
		 reverse-l)
