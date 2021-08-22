#lang racket

(define (cube x)
  (* x x x))

(define (inc a)
  (+ a 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term
              (next a)
              next
              b))))

(define (integral f a b dx)
  (* dx
     (sum f
       (+ a (/ dx 2))
       (lambda(x) (+ x dx))
       b)))

(define (integral-simpson f a b n)
  (define (y-coeff k)
    (cond ((or (= k 0) (= k n)) 1)
          ((even? k) 2)
          (else 4)))

  (define h (/ (- b a) n))

  (* (/ h 3.0)
     (sum (lambda(k) (* (y-coeff k)
                        (f (+ a (* k h)))))
          0
          inc
          n)))

(integral cube 0 1 0.01) ; 0.24998750000000042
(integral-simpson cube 0 1 100) ; 0.25

(integral cube 0 1 0.001) ; 0.249999875000001
(integral-simpson cube 0 1 1000) ; 0.25
