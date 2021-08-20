#lang racket

; Implementation of a recursive formula for binomial coefficients


; n - number of a line in Pascal's triangle
; r - index in the line n
(define (pascal-triangle n r)
  (cond ((or (= r 0) (= r n)) 1)
        ((> r n) 0)
        (else (+ (pascal-triangle (- n 1) (- r 1))
                 (pascal-triangle (- n 1) r)))))

(pascal-triangle 4 2) ; 6
