#lang racket

(require "flatmap.rkt"
         "enumerate-interval.rkt")

(define (ordered-triples n)
  (flatmap (lambda (i)
         (flatmap (lambda (j)
				(map (lambda (k)
					   (list k j i))
					 (enumerate-interval 1 (- j 1))))
			  (enumerate-interval 1 (- i 1))))
         (enumerate-interval 1 n)))

(define (sum-triple triple)
  (+ (car triple) (cadr triple) (caddr triple)))

(define (sum-equals-target? target)
  (lambda (triple)
	(= target (sum-triple triple))))

(define (ordered-triples-with-total s n)
  (filter
	(sum-equals-target? s)
	(ordered-triples n)))

(provide ordered-triples-with-total)
