#lang racket

(define (inc x)
  (+ x 1))

(define (identity x) x)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; prime number in interval [1;5]
(define (prime? x)
  (or (= x 2) (= x 3) (= x 5)))

(define (filtered-accumulate combiner null-value predicate term a next b)
  (define (iter a result cnt)
    (cond ((= cnt b) result)
          ((predicate a) (iter (next a) (combiner result (term a)) (inc cnt)))
          (else (iter (next a) result (inc cnt)))))
  (iter a null-value 0))

; A
(define (sum-primes-sqr a b)
  (filtered-accumulate + 0 prime? sqr a inc b))

; B

(define (solution n)
  (filtered-accumulate * 1 (lambda(i) (and (< i n) (= 1 (gcd i n)))) identity 0 inc n))
