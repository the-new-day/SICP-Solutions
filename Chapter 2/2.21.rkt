#lang racket

(define (square-list items)
  (if (null? items)
      '()
      (cons (sqr (car items))
            (square-list (cdr items)))))

(define (square-list2 items)
  (map sqr items))

(square-list (list 1 2 3 4 5)) ; '(1 4 9 16 25)
(square-list2 (list 1 2 3 4 5)) ; '(1 4 9 16 25)
