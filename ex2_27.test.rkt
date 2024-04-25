#lang racket

(require rackunit
		 "ex2_27.rkt")

(check-equal? (deep-reverse-iter '(1 4 9 16 25)) '(25 16 9 4 1) "book example")
(check-equal? (deep-reverse-iter '()) '() "empty list iterative")
(check-equal? (deep-reverse-iter '(a)) '(a) "single element iterative")
(check-equal? (deep-reverse-iter '((a b c) (d e) (f) g)) '(g (f) (e d) (c b a)) "list of lists iterative")
(check-equal? (deep-reverse-iter '(
								   ((a b c) (d e) (f) g)
								   (h (i) (j k))
								   (l m)
								   n))
			  '(n (m l) ((k j) (i) h) (g (f) (e d) (c b a)))
			  "list of lists of lists iterative")

(check-equal? (deep-reverse-rec '(1 4 9 16 25)) '(25 16 9 4 1) "book example recursive")
(check-equal? (deep-reverse-rec '()) '() "empty list recursive")
(check-equal? (deep-reverse-rec '(a)) '(a) "single element recursive")
(check-equal? (deep-reverse-rec '((a b c) (d e) (f) g)) '(g (f) (e d) (c b a)) "list of lists recursive")
(check-equal? (deep-reverse-rec '(
								   ((a b c) (d e) (f) g)
								   (h (i) (j k))
								   (l m)
								   n))
			  '(n (m l) ((k j) (i) h) (g (f) (e d) (c b a)))
			  "list of lists of lists recursive")
