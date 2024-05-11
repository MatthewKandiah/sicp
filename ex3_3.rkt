#lang racket

(define (make-account balance password)
  (define (with-pw-verification proc pw)
    (if (eq? password pw)
        proc
        (error "Incorrect password")))
  (define (do-withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (do-deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m p)
    (cond ([eq? m 'withdraw] (with-pw-verification do-withdraw p))
          ([eq? m 'deposit] (with-pw-verification do-deposit p))
          (else (error "Unknown request: MAKE-ACCOUNT"
                       m))))
  dispatch)

(provide make-account)
