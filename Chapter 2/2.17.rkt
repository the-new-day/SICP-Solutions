#lang racket

(define (last-pair x)
  (list (list-ref x
                  (- (length x) 1))))

(define lst (list 1 2 3 3 -9 0))

(last-pair lst) ; 0
