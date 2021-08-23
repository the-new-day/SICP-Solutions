#lang racket

(define (f g)
  (g 2))

(f f)

; Use substitution model
; (f f)
; (f 2)
; (2 2)
; Interpreter returns an error:
; expected a procedure that can be applied to arguments
;  given: 2
