#|
Write a procedure that computes the elements of Pascal's triangle using a recursive process
|#

; couldn't work this one out, probably because I was trying to get a whole row and haven't grokked recursive list manipulations yet! This solution is from http://community.schemewiki.org/?sicp-ex-1.12
(define (pascal n)
  (define (p-row prev)
	; if prev contains less than two elements, return '(1)
    (cond ((null? (cdr prev)) (list 1))
		  ; if the first element of prev is 1, return '(1 <sum of first element of prev and the next element> <the rest of the row evaluated by recursively calling this procedure>)
		  ((= 1 (car prev))(cons 1 (cons (+ (car prev) (cadr prev)) (p-row (cdr prev)))))
		  ; first element is not 1 and prev contains at least two elements - we're in the middle of a row, return '(<sum of first element of prev and the next element> <the rest of the row evaluated by recursively calling this procedure>)
		  (else (cons (+ (car prev) (cadr prev)) (p-row (cdr prev))))))
	(cond ((< n 1) (display "error: one or more rows"))
		  ; base cases
		  ((= n 1) 1)
		  ((= n 2) (list 1 1))
		  ; the n-th row is calculated from the (n-1)-th row
		  (else (p-row (pascal (- n 1)))))
	)
