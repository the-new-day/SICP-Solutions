#lang racket

; A

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (* result (term a)))))
  (iter a 1))

; calculates PI/2 * 2
; PI/2 = 2 * (PI/4) = (2*2 * 4*4 * 6*6 * 8) /
;                     (3*3 * 5*5 * 7*7)

(define (calculate-pi n)
  (* 2
     n
     (product (lambda(x) (/ (sqr x)
                       (sqr (+ x 1))))
         2.0
         (lambda(x) (+ x 2))
         n)))

(calculate-pi 10000)

; B

(define (product-recursive term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-recursive term
                            (next a)
                            next
                            b))))
