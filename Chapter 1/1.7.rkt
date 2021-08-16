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

; Keep improving the guess until it's the most accurate result with the current precision

(define (good-enough? guess x)
  (= guess (improve guess x)))

(define (sqr x)
  (* x x))

(define (sqrt x)
  (if (< x 0)
      #f
      (sqrt-iter 1.0 x)))

(sqrt 4)
