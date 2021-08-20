#lang racket

(define (fast-expt b n)
  (define (iter b n a)
    (cond ((= n 0) a)
          ((even? n) (iter (sqr b) (/ n 2) a))
          (else (iter b (- n 1) (* a b)))))
  (iter b n 1))

(fast-expt 2 4) ; 16
