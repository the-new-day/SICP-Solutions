#lang racket

(define (make-interval a b)
  (cons (min a b) (max a b)))

(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

(define (div-interval x y)
  (if (= (lower-bound y) 0)
      (error "Second interval starts with 0")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(div-interval (make-interval 0 5)
              (make-interval 0 6))
