#lang racket

; They should be primitives...
  
(define (accumulate op initial sequence) 
  (if (null? sequence) 
      initial 
      (op (car sequence) 
          (accumulate op initial (cdr sequence))))) 
  
(define (enumerate-interval low high) 
  (if (> low high) 
      '() 
      (cons low (enumerate-interval (+ low 1) high)))) 
  
(define (flatmap proc seq) 
   (accumulate append '() (map proc seq)))

; Solution:

(define (unique-triples n)
  (flatmap (lambda(i)
             (flatmap (lambda(j)
                        (map (lambda(k) (list i j k))
                             (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (triples n s)
  (filter (lambda(x) (= (accumulate + 0 x) s))
          (unique-triples n)))

(triples 6 8) ; ((4 3 1) (5 2 1))
