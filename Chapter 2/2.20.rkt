#lang racket

(define (same-parity x . l)
  (let ((predicate? (if (even? x)
                        even?
                        odd?)))
    
    (define (filter items result)
      (if (null? items)
          result
          (filter (cdr items)
                  (if (predicate? (car items))
                      (append result (list (car items)))
                      result))))
    (filter l (list x))))

(same-parity 1 2 3 4 5 6 7) ; '(1 3 5 7)
(same-parity 2 3 4 5 6 7) ; '(2 4 6)
