#lang sicp

(define (equal? list1 list2)
  (cond ((and (null? list1)
              (null? list1)) true)
        ((or (null? list1)
             (null? list1)) false)
        ((and (number? list1)
              (number? list1)) (= list1 list2))
        ((and (symbol? list1)
              (symbol? list2))
         (if (eq? list1 list2)
             true
             false))
        ((and (list? list1)
              (list? list2))
         (if (and (equal? (car list1) (car list2))
                  (equal? (cdr list1) (cdr list2)))
             true
             false))
        (else false)))

(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))
