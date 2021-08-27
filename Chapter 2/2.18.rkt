#lang racket

(define (reverse x)
  (define (iter result cnt)
    (if (< cnt 0)
        result
        (iter (append result
                      (list (list-ref x cnt)))
              (- cnt 1))))
  (iter (list) (- (length x) 1)))

(reverse (list 1 4 9 16 25))
