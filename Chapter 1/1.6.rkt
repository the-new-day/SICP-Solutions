#lang racket

; This program will never finish.

; Since Scheme's interpreter uses an applicative order, the third argument
; supplied to new-if in sqrt-iter will be evaluated before going to the new-if's body
; and will call itself indefinitely.

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
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
