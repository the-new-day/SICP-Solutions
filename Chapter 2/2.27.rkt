#lang racket

(define (deep-reverse x)
  (define (work items result)
    (if (null? items)
        result
        (let ((first-elem (car items)))
          (work (cdr items)
                (cons (if (list? first-elem)
                          (deep-reverse first-elem)
                          first-elem)
                      result)))))
  (work x '()))

(define x (list (list 1 2) (list 3 4)))
(deep-reverse x) ; ((4 3) (2 1))
