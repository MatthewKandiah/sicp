#lang racket

(define (subsets s)
  (if (null? s)
      '(())
      (let ((rest (subsets (cdr s))))
        (append rest
                (map
				 (prepend (car s))
                 rest)))))

(define (prepend x)
  (lambda (y)
	(cons x y)))

#|
(subsets '(1 2 3))
(append ((2 3) (2) (3) ()) ((1 2 3) (1 2) (1 3) (1)))

(subsets '(2 3))
(append ((3) ()) ((2 3) (2)))

(subsets '(3))
(append () (3)))

`rest` is defined as the list of all subsets not including (car s)
Prepending (car s) to each of the elements of `rest` then generates all the subsets that do include (car s)
Combining the list of subsets containing x and the list of subsets that don't contain x then gives us the list of all subsets
|#

