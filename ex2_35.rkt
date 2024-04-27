#lang racket

(require "ex2_28.rkt"
         "accumulate.rkt")

(define (count-leaves t)
  (length (fringe t)))

(define (count-leaves-explicit t)
  (accumulate
   + 0 (map (lambda (node)
              (if (pair? node)
                  (count-leaves-explicit node)
                  1))
            t)))

(provide count-leaves)
