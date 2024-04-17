#|
f(n) = n for n < 3
f(n) = f(n-1) + 2f(n-2) + 3f(n-3) for n >= 3

Write procedures that compute f using a recursive process and an iterative process.
|#

(define (f-recursive n)
  (if (< n 3)
	n 
	(+ (f-recursive (- n 1)) (* 2 (f-recursive (- n 2))) (* 3 (f-recursive (- n 3))))
	))

(define (f-iterative n)
  (define (f-iter a b c count)
	(define next 
	  (if (< count 3)
	    count
	    (+ c (* 2 b) (* 3 a))
	  )
	)
	(if (= count (+ n 1))
	  c
	  (f-iter b c next (+ count 1))
	)
  )

  (f-iter 0 0 0 0)
  )

(define (check n) 
  (= (f-recursive n) (f-iterative n)))

; quick check that both functions give the same results, runs surprisingly slowly!
(define (test n)
  (if (= n 0)
	#t
	(if (check n)
	  (test (- n 1))
	  #f)
  ))
