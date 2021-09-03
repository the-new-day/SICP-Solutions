#lang sicp

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (caddr frame))

(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame2 frame)
  (car frame))

(define (edge1-frame2 frame)
  (cadr frame))

(define (edge2-frame2 frame)
  (caddr frame))

(define frame (make-frame 1 2 3))

(origin-frame frame)
(edge1-frame frame)
(edge2-frame frame)

(newline)

(origin-frame2 frame)
(edge1-frame2 frame)
(edge2-frame2 frame)

; Selectors for the 1st implementation work perfectly for the 2nd implementation without any changes
