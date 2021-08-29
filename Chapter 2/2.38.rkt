#lang racket

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-right / 1 (list 1 2 3)) ; 1 + 1/2
; Use substitution model:
; (/ 1 (fold-right / 1 (2 3)))
; (/ 1 (/ 2 (fold-right / 1 (3))))
; (/ 1 (/ 2 (/ 3 (fold-right / 1 ()))))
; (/ 1 (/ 2 (/ 3 1)))
; (/ 1 (/ 2 3))
; (/ 1 2/3)
; 3/2

(fold-left / 1 (list 1 2 3)) ; 1/6
; Use substitution model:
; (iter (/ 1 1) (2 3))
; (iter (/ 1 2) (3))
; (iter (/ 1/2 3) ()) = (iter 1/6 ())
; 1/6

(fold-right list '() (list 1 2 3)) ; '(1 (2 (3 ())))
(fold-left list '() (list 1 2 3)) ; '(((() 1) 2) 3)

; I think, op must be a commutative operation (such as addition)
; to give the same result in both fold-right and fold-left
