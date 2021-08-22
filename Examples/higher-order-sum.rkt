#lang racket

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term
              (next a)
              next
              b))))

(define (inc a)
  (+ a 1))

(define (cube x)
  (* x x x))

(define (sum-int a b)
  (sum (lambda(x) x) a inc b))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (pi-sum a b)
  (sum (lambda(x) (/ 1.0 (* x (+ x 2))))
       a
       (lambda(x) (+ x 4))
       b))

(define (integral f a b dx)
  (* dx
     (sum f
       (+ a (/ dx 2))
       (lambda(x) (+ x dx))
       b)))

(sum-int 1 10)
(sum-cubes 1 10)
(* 8 (pi-sum 1 1000))
(integral cube 0 1 0.001)
