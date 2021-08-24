#lang racket

(define (iterative-improve good-enough? improve)
  (define (iter x)
    (if (good-enough? x)
        x
        (iter (improve x))))
  iter)

(define (sqrt x)
  (define (improve guess)
    (/ (+ guess (/ x guess))
       2.0))
  
  ((iterative-improve (lambda(guess) (= guess (improve guess)))
                      improve)
   x))

(define tolerance 0.001)

(define (fixed-point f first-guess)
  ((iterative-improve (lambda(guess) (< (abs (- guess (f guess))) tolerance))
                      f)
   first-guess))

(sqrt 16) ; 4.0
(fixed-point cos 1.0) ; 0.7395672022122561
