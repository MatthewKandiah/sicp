#lang racket

(define (flatmap proc lst)
  (foldr append '() (map proc lst)))

(provide flatmap)
