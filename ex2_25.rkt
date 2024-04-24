#lang racket

(define a '(1 3 (5 7) 9))
(define b '((7)))
(define c '(1 (2 (3 (4 (5 (6 7)))))))

;; should all print 7
(display (car (cdr (car (cdr (cdr a))))))
(newline)
(display (car (car b)))
(newline)
(display (car (cdr (car (cdr (car (cdr (car (cdr (car ( cdr (car (cdr c)))))))))))))
(newline)
