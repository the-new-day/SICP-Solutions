#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (append seq1 seq2)
  (accumulate cons seq1 seq2))

(define (length sequence)
  (accumulate (lambda(x y) (+ y 1)) 0 sequence))

(define sequence (list 1 2 3 4 5 6))

(map sqr sequence)
(append sequence sequence)
(length sequence)
