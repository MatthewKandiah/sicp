#lang racket

(define (make-accumulator val)
  (lambda (x)
	(begin
	  (set! val (+ val x))
	  val)))

(require rackunit)

(define acc1 (make-accumulator 10))
(define acc2 (make-accumulator 100))

(check-equal? (acc1 0) 10)
(check-equal? (acc2 0) 100)

(check-equal? (acc1 5) 15)
(check-equal? (acc2 50) 150)

(check-equal? (acc1 8) 23)
(check-equal? (acc2 80) 230)

