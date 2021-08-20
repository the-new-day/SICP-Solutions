#lang racket

(define (expt-recursive b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(define (expt-iter b n)
  (define (iter b cnt product)
    (if (= cnt 0)
        product
        (iter b
              (- cnt 1)
              (* b product))))
 (if (< n 0)
     (/ -1.0 (iter b (abs n) 1))
     (iter b (abs n) 1)))

(define (sqr x)
  (* x x))

(define (fast-expt b n)
  (define (solution b n)
    (cond ((= n 0) 1)
          ((even? n) (sqr (fast-expt b (/ n 2))))
          (else (* b (fast-expt b (- n 1))))))
  (if (< n 0)
     (/ -1.0 (solution b (abs n)))
     (solution b (abs n))))

