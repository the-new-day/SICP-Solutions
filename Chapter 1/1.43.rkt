#lang racket

(define (compose f g)
  (lambda(x) (f (g x))))

(define (repeated f n)
  (define (iter result cnt)
    (if (= cnt n)
        result
        (iter (compose result f)
              (+ cnt 1))))
  (iter (lambda(x) x) 0))

((repeated sqr 2) 5)
