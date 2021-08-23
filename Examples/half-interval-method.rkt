#lang racket

(define (average x y)
  (/ (+ x y) 2.0))

(define (search f neg-point pos-point)
  (define (close-enough? x y)
    (< (abs (- x y)) 0.001))
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((= 0 test-value) midpoint)
                ((> test-value 0) (search f neg-point midpoint))
                (else (search f midpoint pos-point)))))))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else
           (error "Arguments have the same signs")))))

(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3))
                      1
                      2)
