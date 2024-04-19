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
  (display elapsed-time)
  (newline))

; NOTE - mit-scheme does implement (runtime) but it returns the time in seconds, which isn't useful to us! (real-time-clock) should give us the same value in ticks, which should allow more precise comparison.

(define (search-for-primes start n)
  (define (aux x found-count)
	(debugging x found-count)
	(define is-prime (timed-prime-test x))
	(define new-found-count 
	  (if is-prime (+ found-count 1) found-count))
	(define (next x)
	  (if (odd? x)
		(+ x 2)
		(+ x 1)))
	(if (< new-found-count n)
	  (aux (next x) new-found-count)
	  (display "Done! ")))
  (aux start 0)
  )

(define (debugging x found-count)
  (newline)
  (display (list x found-count)))
