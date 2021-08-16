#lang racket

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (sqr guess) x)) 0.001))

(define (sqr x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1 x))

(sqrt 100)
