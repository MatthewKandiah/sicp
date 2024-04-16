(define tolerance 0.001)

(define (sqrt x) (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (is-good-enough guess x)
	guess
	(sqrt-iter (improve guess x) x)))

(define (is-good-enough guess x)
  (< (abs (- (square guess) x)) tolerance))

(define (improve guess x) (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2))
