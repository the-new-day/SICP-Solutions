#lang racket

(define (make-interval a b)
  (cons (min a b) (max a b)))

(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))
