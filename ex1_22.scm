; requires prime? procedure - implementation in ex1_21
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (real-time-clock))
  )

(define (start-prime-test n start-time)
  (define result (prime? n))
  (if result
	(report-prime (- (real-time-clock) start-time)))
  result)

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; NOTE - mit-scheme does implement (runtime) but it returns the time in seconds, which isn't useful to us! (real-time-clock) should give us the same value in ticks, which should allow more precise comparison.

(define (search-for-primes start n)
  (define (aux x found-count)
	;(debugging x found-count)
	(define is-prime (timed-prime-test x))
	(define new-found-count 
	  (if is-prime (+ found-count 1) found-count))
	(define (next x)
	  (if (odd? x)
		(+ x 2)
		(+ x 1)))
	(if (< new-found-count n)
	  (aux (next x) new-found-count)
	  (display " Done!")))
  (aux start 0)
  )
#|
(define (debugging x found-count)
  (newline)
  (display (list x found-count)))
|#

#|
To see a difference in runtime, I've had to use much larger numbers, I guess the precision of mit-scheme's clock procedures is too coarse to tell the difference between runtimes for the values suggested in the book. Suppose that shouldn't be a surprise, computers have gotten a lot faster since SICP was written!
I do see the runtime scale with sqrt(N) when using larger arguments though! Increasing the start value by a factor of 100, I see an increase in runtime of approximately a factor 10.
(search-for-primes 1e9 1) ;; 59
(search-for-primes 1e11 1) ;; 442
(search-for-primes 1e13 1) ;; 4174
(search-for-primes 1e15 1) ;; 44230
|#
