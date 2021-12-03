#lang sicp

(define (make-accumulator initial)
  (lambda (add)
    (set! initial (+ initial add))
    initial))

(define A (make-accumulator 5))

(A 10) ; 15
(A 12) ; 27
