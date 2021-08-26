#lang racket

(define (inc x)
  (+ 1 x))

(define (cons x y)
  (* (expt 2 x)
     (expt 3 y)))

(define (selector predicate? next counter)
  (define (iter x cnt)
    (if (predicate? x)
        (iter (next x)
              (counter cnt))
        cnt))
  iter)

(define (car x)
  ((selector even?
             (lambda(n) (/ n 2))
             inc)
   x 0))

(define (cdr x)
  ((selector (lambda(x) (= (remainder x 3) 0))
             (lambda(x) (/ x 3))
             inc)
   x 0))


(car (cons 45 9)) ; 45
(cdr (cons 45 9)) ; 9