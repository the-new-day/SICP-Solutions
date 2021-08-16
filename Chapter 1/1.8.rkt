#lang racket

(define (root-3-iter guess x)
  (if (good-enough? guess x)
      guess
      (root-3-iter (improve guess x)
                 x)))

(define (improve guess x)
  (/ (+ (/ x (sqr guess))
        (* 2 guess))
     3))

(define (good-enough? guess x)
  (= guess (improve guess x)))

(define (sqr x)
  (* x x))

(define (root-3 x)
  (root-3-iter 1.1 x))

(root-3 8)
