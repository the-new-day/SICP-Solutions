#lang racket

(define (union-set set1 set2)
  (define (iter result set1 set2)
    (cond ((null? set1) (append result set2))
          ((null? set2) (append result set1))
          ((= (car set1) (car set2))
           (iter (append result (list (car set1)))
                 (cdr set1)
                 (cdr set2)))
          ((< (car set1) (car set2))
           (iter (append result (list (car set1)))
                 (cdr set1)
                 set2))
          (else (iter (append result (list (car set2)))
                      set1
                      (cdr set2)))))
  
  (iter '() set1 set2))

(define set1 (list 1 2 3 4))
(define set2 (list 3 4 6 9))

;(define curr-time (current-inexact-milliseconds))

(union-set set1 set2)

;(display (- (current-inexact-milliseconds) curr-time))
