#lang racket

(define (repeated f n)
  (define (compose f g)
    (lambda(x) (f (g x))))
  
  (define (iter result cnt)
    (if (= cnt n)
        result
        (iter (compose result f)
              (+ cnt 1))))
  (iter (lambda(x) x) 0))

((repeated sqr 2) 5) ; 625
((repeated sqr 2) 2) ; 16
