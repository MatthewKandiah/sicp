#lang racket

(foldr / 1 (list 1 2 3)) ;; 3/2 from (/ 1 (/ 2 (/ 3 2))) 
(foldl / 1 (list 1 2 3)) ;; 3/2 from (/ 3 (/ 2 (/ 1 1)))
(foldr list '() (list 1 2 3)) ;; '(1 (2 (3 ()))) from (list 1 (list 2 (list 3 ())))
(foldl list '() (list 1 2 3)) ;; '(3 (2 (1 ()))) from (list 3 (list 2 (list 1 ())))

