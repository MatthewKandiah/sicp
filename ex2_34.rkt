#lang racket
(require "accumulate.rkt")

(define (horner-eval x lst)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff (* x higher-terms)))
              0
              lst))

(provide horner-eval)
