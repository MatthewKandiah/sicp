#lang racket

(define (make-monitored proc)
  (let ([count 0])
	(define (increment-count)
	  (set! count (+ count 1)))
	(define (dispatch msg)
	  (cond [(eq? msg 'how-many-calls) count]
			[else (begin
					(increment-count)
					(proc msg))]))
	dispatch))

(require rackunit)
(define square (lambda (x) (* x x)))
(define s (make-monitored square))
(define t (make-monitored square))

(check-equal? (s 'how-many-calls) 0)
(check-equal? (s 10) 100)
(check-equal? (s 'how-many-calls) 1)
(check-equal? (s 4) 16)
(check-equal? (s 'how-many-calls) 2)
(check-equal? (s 2) 4)
(check-equal? (s 'how-many-calls) 3)

(check-equal? (t 'how-many-calls) 0)
(check-equal? (t 10) 100)
(check-equal? (t 'how-many-calls) 1)
(check-equal? (t 4) 16)
(check-equal? (t 'how-many-calls) 2)
(check-equal? (t 2) 4)
(check-equal? (t 'how-many-calls) 3)
