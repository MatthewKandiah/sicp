#lang racket

(define (square-tree-direct tree)
  (cond [(null? tree) '()]
		[(not (pair? tree)) (* tree tree)]
		[else (cons (square-tree-direct (car tree)) (square-tree-direct (cdr tree)))]))

(define (square-tree tree)
  (map (lambda (sub-tree)
		 (if (pair? sub-tree)
		   (square-tree sub-tree)
		   (* sub-tree sub-tree)))
	   tree))
