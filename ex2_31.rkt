#lang racket

(define (tree-map proc tree)
  (cond [(null? tree) '()]
		[(pair? tree) (cons (tree-map proc (car tree)) (tree-map proc (cdr tree)))]
		[else (proc tree)]))

(define (square-tree tree)
  (define (square x) (* x x))
  (tree-map square tree))

(provide square-tree)
