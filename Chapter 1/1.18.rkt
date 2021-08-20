#lang racket

(define (double x)
  (+ x x))

(define (* a b)
  (define (iter a b s)
    (cond ((= a 1) (+ s b))
          (else (iter (floor (/ a 2))
                      (double b)
                      (+ s
                         (if (even? a)
                             0
                             b))))))
  (if (< a 0)
      (- (iter (abs a) b 0))
      (iter (abs a) b 0)))

(* 2 1)
