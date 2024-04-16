; define a procedure that takes 3 arguments and returns the sum of the squares of the two larger arguments
(define (sum-of-squares-of-largest a b c)
  (define min
	(cond 
	  ((and (> a c) (> b c)) c)
	  ((and (> a b) (> c b)) b)
	  (else a)
	  )
	)

  (define (square x) (* x x))

  (define (square-sum x y) (+ (square x) (square y)))
  
  (cond
    ((= min a) (square-sum b c))
	((= min b) (square-sum a c))
	((= min c) (square-sum a b))
	)
  )
