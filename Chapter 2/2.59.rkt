#lang sicp

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))


(define (union-set s1 s2)
  (cond ((or (null? s2) (null? s1)) (append s1 s2))
        ((element-of-set? (car s2) s1)
         (union-set s1 (cdr s2)))
        (else
         (union-set (cons (car s2) s1)
                    (cdr s2)))))

(define set1 (list 1 2 3 4 5))
(define set2 (list 4 5 6 7 8))

(union-set set1 set2)
