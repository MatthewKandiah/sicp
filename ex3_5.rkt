#lang racket

(define (estimate-integral p x1 x2 y1 y2 n)
  (define (iter trials-remaining trials-passed)
    (let ([r1 (random)]
          [r2 (random)])
      (cond
         [(= trials-remaining 0) (* (/ trials-passed n) (* (- x2 x1) (- y2 y1)))]
         [(p r1 r2) (iter (- trials-remaining 1) (+ trials-passed 1))]
         [else (iter (- trials-remaining 1) trials-passed)])))
  (iter n 0))

;; estimate pi by measuring the area of a unit circle
(define pi-approx (estimate-integral
                   (lambda (x y) (<= (+ (* x x) (* y y)) 1))
                   0
                   1
                   0
                   1
                   1000000))

(display (exact->inexact (* 4 pi-approx))) ;; gets about 3.14 with a million iterations
(newline)
