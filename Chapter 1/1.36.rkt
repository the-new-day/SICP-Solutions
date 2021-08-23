#lang racket

(define tolerance 0.001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess step)
    (let ((next (f guess)))
      ;(display step)
      ;(display ": ")
      ;(display guess)
      ;(newline)
      (cond ((close-enough? guess next)
             (display step)
             (display " steps")
             (newline)
             (display "Result: ")
             next)
            (else (try next (+ step 1))))))
  (try first-guess 1))

(define (with-average-damping x)
  (/ (+ x
        (/ (log 1000) (log x)))
     2))

(define (without-average-damping x)
  (/ (log 1000) (log x)))

(display "With average damping:")
(newline)
(fixed-point with-average-damping 1.1)
(newline)

(display "Without average damping:")
(newline)
(fixed-point without-average-damping 1.1)
