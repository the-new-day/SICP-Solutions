#lang racket

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (if (negative? d)
              (- (/ n g))
              (/ n g))
          (abs (/ d g)))))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))

 (define (print-rat x) 
   (newline) 
   (display (numer x)) 
   (display "/") 
   (display (denom x))) 

(print-rat (make-rat 2 -4)) ; -1/2
