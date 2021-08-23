#lang racket

; <from-1.43>

(define (smooth f)
  (define (average-3 x y z)
    (/ (+ x y z) 3))
  
  (let ((dx 0.0001))
    (lambda(x)
      (average-3 (f (- x dx))
                 (f x)
                 (f (+ x dx))))))

(define (repeated f n)
  (define (compose f g)
    (lambda(x) (f (g x))))
  
  (define (iter result cnt)
    (if (= cnt n)
        result
        (iter (compose result f)
              (+ cnt 1))))
  (iter (lambda(x) x) 0))

; </from-1.43>

(define (n-fold-smooth f n)
  (repeated (smooth f) n))

((n-fold-smooth sqr 2) 2) ; 16.000000060000005 (smoothing...), ~ 2^(2^2)
