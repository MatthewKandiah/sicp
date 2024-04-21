(define (inc x)
  (+ x 1))

(define (double f)
  (lambda 
	(x) 
	(f (f x))))

#|
(((double (double double)) inc) 5)
Does the same as (+ 16 5)

You can expand it out to see (double double) is the same as saying "apply 4 times", i.e. lambda (x) (f (f (f (f x))))
So if we say (define apply4 (double double)) we can see (double (double double)) is the same as (double apply4) i.e. apply 4 times, 4 times => apply 16 times
|#
