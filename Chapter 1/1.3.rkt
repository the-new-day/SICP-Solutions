#lang racket

(define (sqr x)
  (* x x))

(define (sum-of-squares a b)
  (+ (sqr a) (sqr b)))

(define (sum-of-two-biggest-sqr a b c)
  (cond ((and (>= a b) (>= b c)) (sum-of-squares a b))
        ((and (>= a b) (<= b c)) (sum-of-squares a c))
        ((and (<= a b) (<= a c)) (sum-of-squares b c))))

(sum-of-two-biggest-sqr 2 4 3) ; 25
