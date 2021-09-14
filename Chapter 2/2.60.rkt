#lang sicp

; this version is the same as for non-repeating sets - O(n)
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

; this version doesn't use element-of-set? with O(n)
; so it's complexity is O(1)
(define adjoin-set cons)

; this version is the same as for non-repeating sets - O(n^2)
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

; O(n)
(define union-set append)

(define set1 (list 1 2 3 4 5 5 8))
(define set2 (list 4 5 6 7 8 8))

(element-of-set? 5 set1) ; #t
(intersection-set set1 set2) ; (4 5 5 8)
(adjoin-set 1 set2) ; (1 4 5 6 7 8 8)
(union-set set1 set2) ; (8 8 7 6 5 4 1 2 3 4 5 5 8) - all of 13 elements of 2 sets
