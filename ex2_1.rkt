#lang racket
(define (make-rat n d)
  (let ([g (gcd n d)]
        [neg? (or
               (and (< n 0) (> d 0))
               (and (< d 0) (> n 0)))])
    (if neg?
        (cons (* -1 (abs (/ n g))) (abs (/ d g)))
        (cons (abs (/ n g)) (abs (/ d g))))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (print-rat x)
  (let ([non-trivial-denom? (not (= (denom x) 1))])
    (newline)
    (display (numer x))
    (cond (non-trivial-denom? (display "/")))
    (cond (non-trivial-denom? (display (denom x))))))

(define one-half (make-rat 1 2))

(define one-third (make-rat 1 3))

(print-rat (add-rat one-half one-third));; expect 5/6
(print-rat (mul-rat one-half one-third));; expect 1/6
(print-rat (sub-rat one-half one-third));; expect 1/6
(print-rat (div-rat one-half one-third));; expect 3/2
(print-rat (add-rat one-third one-third));; expect 2/3
(newline)
(display (equal-rat? one-half one-half));; expect #t
(newline)
(display (equal-rat? one-half one-third));; expect #f
(print-rat (make-rat -1 2));; expect -1/2
(print-rat (make-rat 1 -2));; expect -1/2
(print-rat (make-rat -1 -2));; expect 1/2
(print-rat (make-rat 2 1));; expect 2
(print-rat (make-rat -2 1));; expect -2
