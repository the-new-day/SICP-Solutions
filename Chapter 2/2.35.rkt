#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves tree)
  (accumulate +
              0
              (map (lambda (branch)
                     (if (pair? branch)
                         (count-leaves branch)
                         1))
                   tree)))
