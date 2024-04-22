#lang racket

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))

(define (make-segment p q)
  (cons p q))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (midpoint-segment s)
  (define (average x y)
    (/ (+ x y) 2))
  (let ([start-point (start-segment s)]
        [end-point (end-segment s)])
    (make-point
     (average (x-point start-point) (x-point end-point))
     (average (y-point start-point) (y-point end-point)))))

(define point1 (make-point 2 10))
(define point2 (make-point 4 20))
(print-point (midpoint-segment (make-segment point1 point2))) ;; expect (3, 15)
(print-point (midpoint-segment (make-segment point2 point1))) ;; expect (3, 15)
