#lang racket

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; If b is greater than 0, then the expression will be (+ a b) because the if-expression
; will return +
; Otherwise (if b <= 0) the expression will be (- a b) and the negative number b will be
; substracted from number a because the if-expression will return -

; This procedure represents an expression: a + |b|

(a-plus-abs-b 2 -3) ; 5
(a-plus-abs-b 2 3) ; 5
