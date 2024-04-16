#|
Using the given formula, implement a cube-root procedure
|#

(define (cube x) (* x x x))

(define (is-good-enough guess target tolerance)
  (< (abs(- (cube guess) target)) tolerance))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(define (cube-root-iter guess target)
  (if (is-good-enough guess target 0.001)
	  guess
	  (cube-root-iter (improve guess target) target)
	)
  )

(define (improve guess target)
  (/ (+ (/ target (* guess guess)) (* 2 guess)) 3))

