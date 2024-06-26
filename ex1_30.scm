#|
Rewrite the sum procedure to use an iterative process
|#

(define (sum-rec term a next b)
  (if (> a b)
	0
	(+ (term a)
	   (sum-rec term (next a) next b))))

(define (sum-iter term a next b)
  (define (iter a result)
	(if (> a b)
	  result
	  (iter (next a) (+ result (term a)))))
  (iter a 0))
