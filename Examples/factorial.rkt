#lang racket

(define (factorial-recursive n)
  (if (<= n 0)
      1
      (* n (factorial-recursive (- n 1)))))

(define (factorial-iter n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (+ counter 1))))
  (iter 1 1))

(factorial-iter 4)
