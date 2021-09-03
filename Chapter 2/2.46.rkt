#lang sicp

(define (make-vect x y)
  (cons x y))

(define (xcor-vect vect)
  (car vect))

(define (ycor-vect vect)
  (cdr vect))

(define (add-vect vect1 vect2)
  (make-vect (+ (xcor-vect vect1)
                (xcor-vect vect2))
             (+ (ycor-vect vect1)
                (ycor-vect vect2))))

(define (sub-vect vect1 vect2)
  (make-vect (- (xcor-vect vect1)
                (xcor-vect vect2))
             (- (ycor-vect vect1)
                (ycor-vect vect2))))

; sub-vect can be defined that way...
(define (sub-vect2 vect1 vect2)
  (add-vect vect1 (scale-vect -1 vect2)))

(define (scale-vect s vect)
  (make-vect (* (xcor-vect vect) s)
             (* (ycor-vect vect) s)))

(define vect1 (make-vect 2 2))
(define vect2 (make-vect 3 9))

(add-vect vect1 vect2)
(sub-vect vect1 vect2)
(scale-vect 2 vect1)
