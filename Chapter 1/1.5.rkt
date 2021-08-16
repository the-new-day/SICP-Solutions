#lang racket

; If the interpreter uses an applicative order, then the program will never finish.
; This is because the second argument in the last expression is evaluated before
; substituting into the procedure's body

; If the interpreter uses a normal order, then 0 will be returned and the program will finish.
; Since the first argument x is equal to 0, the predicate expression will return true
; and the second argument y will not be evaluated

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))
