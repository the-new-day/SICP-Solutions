#lang racket

(define (fib n)
  (cond ((< n 2) n)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(fib 7)

(define (fib-iter n)
  (define (iter a b cnt)
    (if (= cnt n)
        b
        (iter (+ a b)
              a
              (+ cnt 1))))
  (iter 1 0 0))

(fib-iter 7)
