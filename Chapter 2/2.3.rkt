#lang racket

; <from-2.2>

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

; </from-2.2>

; calculates length of a segment
; L = sqrt((Xe - Xs)^2 + (Ye - Ys)^2) (e and s - end and start)
(define (segment-length segment)
  (let ((end (end-segment segment))
        (start (start-segment segment)))
    (sqrt (+ (sqr (- (x-point end)
                     (x-point start)))
             (sqr (- (y-point end)
                     (y-point start)))))))

; FIRST IMPLEMENTATION

; a, b, c are adjacent vertices of a rectangle
(define (make-rect a b c)
  (cons (cons a b)
        c))

(define (width-lenght rect)
  (segment-length (car rect)))

(define (height-lenght rect)
  (segment-length (make-segment (cdr (car rect))
                                (cdr rect))))

; P = (w+h) * 2
(define (rect-perimeter rect)
  (* 2
     (+ (width-lenght rect)
        (height-lenght rect))))

; A = w*h
(define (rect-area rect)
  (* (width-lenght rect)
     (height-lenght rect)))

; SECOND IMPLEMENTATION

; a, c are non-adjacent vertices
; height is rectangle's height
(define (make-rect2 a c height)
  (cons (cons a c)
        height))

(define (width-lenght2 rect)
  (sqrt (- (sqr (segment-length (car rect)))
           (sqr (cdr rect)))))

(define (height-lenght2 rect)
  (cdr rect))

(define (rect-perimeter2 rect)
  (* 2
     (+ (width-lenght2 rect)
        (height-lenght2 rect))))

(define (rect-area2 rect)
  (* (width-lenght2 rect)
     (height-lenght2 rect)))

; TESTING

; rectangle ABCD
; A(0;0) B(0;6) C(9;6)
(define rect (make-rect (make-point 0 0)
                        (make-point 0 6)
                        (make-point 9 6)))

; rectangle ABCD
; A(0;0) C(9;6) height = 6
(define rect2 (make-rect2 (make-point 0 0)
                          (make-point 9 6)
                          6))

; User should get only rect-perimeter and rect-area procedures.
; I don't know how to encapsulate "private" procedures in Scheme

(rect-perimeter rect) ; 30
(rect-area rect) ; 54

(rect-perimeter2 rect2) ; 30
(rect-area2 rect2) ; 54
