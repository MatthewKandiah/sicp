#lang racket

(require "flatmap.rkt")

;; Return a list of ways to arrange n queens on an nxn board with no queens attacking each other
#|
Strategy:
  - Represent a board as a list of pairs, telling us the coordinates of all the queens placed on it
  - Pairs representing queen coords (x y): x in [1,n] tells us the column y in [1,n] tells us the row
  - Generate a list of all boards that are valid answers. Start by enumerating all possible positions with the queen in the first column. Then for each of those positions, enumerate all positions with a queen in the next column and filter out the invalid positions where the new queen is attacking an existing queen.
|#

(define (make-coord x y)
  (list x y))

(define (coord-col c)
  (car c))

(define (coord-row c)
  (cadr c))

(define (new-position-valid? position board)
  (not
   (or
    (column-collision? position board)
    (row-collision? position board)
    (diagonal-collision? position board))))

(define (column-collision? position board)
  (cond
    [(null? board) #f]
    [(= (coord-col position) (coord-col (car board))) #t]
    [else (column-collision? position (cdr board))]))

(define (row-collision? position board)
  (cond
    [(null? board) #f]
    [(= (coord-row position) (coord-row (car board))) #t]
    [else (row-collision? position (cdr board))]))

(define (diagonal-collision? position board)
  (cond
    [(null? board) #f]
    [(= (- (coord-row position) (coord-row (car board))) (- (coord-col position) (coord-col (car board)))) #t]
    [(= (- (coord-row position) (coord-row (car board))) (- (coord-col (car board)) (coord-col position))) #t]
    [else (diagonal-collision? position (cdr board))]))

(define (enumerate-column col board-size)
  (define (iter i out)
    (if (> i board-size)
        out
        (iter (+ i 1) (cons (make-coord col i) out))))
  (iter 1 '()))

(define (queens board-size)
  (define (make-valid-boards new-coord old-boards)
    (define (iter boards-in boards-out)
      (cond [(null? boards-in) boards-out]
            [(new-position-valid? new-coord (car boards-in))
             (iter (cdr boards-in) (cons (cons new-coord (car boards-in)) boards-out))]
            [else
             (iter (cdr boards-in) boards-out)]))
    (iter old-boards '()))

  (define (update-boards-with-column col boards)
    (flatmap (lambda (new-coord)
               (make-valid-boards new-coord boards))
             (enumerate-column col board-size)))

  (define (queens-iter col boards)
    (if (> col board-size)
        boards
        (queens-iter (+ 1 col) (update-boards-with-column col boards))))
  (queens-iter 2 (map (lambda (coord) (list coord)) (enumerate-column 1 board-size))))

(provide queens)
