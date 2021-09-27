#lang sicp

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< x (car set)) (cons x set))
        ((= x (car set)) set)
        (else (cons (car set) (adjoin-set x (cdr set))))))

(define set (list 1 2 3 5))
(adjoin-set 4 set)
