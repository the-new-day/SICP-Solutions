#lang racket

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (* a b)
  (define (iter a b i)
    (cond ((= b 0) i)
          ((even? b) (iter (double a) (halve b) i))
          (else (iter a (- b 1) (+ i a)))))
  (iter a b 0))

(* 4 5) ; 20
