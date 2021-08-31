#lang sicp
(#%require sicp-pict)

(define (split x y)
  (define (proc painter n)
    (if (= n 0)
        painter
        (let ((smaller (proc painter (- n 1))))
          (x painter (y smaller smaller)))))
  proc)

(define right-split (split beside below))
(define up-split (split below beside))

(paint (right-split einstein 2))
(paint (up-split einstein 2))
