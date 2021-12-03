#lang sicp

(define (make-monitored proc)
  (let ((calls 0))
    (lambda (arg)
      (cond ((eq? arg 'how-many-calls?) calls)
            ((eq? arg 'reset-count) (set! calls 0))
            (else (begin (set! calls (+ calls 1))
                         (proc arg)))))))

(define s (make-monitored sqrt))

(s 25) ; 5
(s 4) ; 2
(s 16) ; 4

(newline)
(s 'how-many-calls?) ; 3

(s 'reset-count)
(s 'how-many-calls?) ; 0