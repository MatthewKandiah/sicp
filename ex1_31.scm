(define (product-rec term a next b)
  (if (> a b)
	1
	(* (term a) (product-rec term (next a) next b))))

(define (product-iter term a next b)
  (define (aux a result)
	(if (> a b)
	  result
	  (aux (next a) (* result (term a)))))
  (aux a 1))

(define (approx-pi product b)
  (define pi-a 2)
  (define (square x) (* x x))
  (define (pi-term x) (/ (* x (+ x 2)) (square (+ x 1))))
  (define (pi-next x) (+ x 2))
  (* 4 (exact->inexact(product pi-term pi-a pi-next b)))
  )

(define (approx-pi-rec b)
  (approx-pi product-rec b))

(define (approx-pi-iter b)
  (approx-pi product-iter b))
