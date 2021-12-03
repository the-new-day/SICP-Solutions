#lang sicp

(define f
  (let ((state -1))
    (lambda (x)
      (if (= state -1)
          (begin (set! state x)
                 x)
          0))))

(+ (f 0) (f 1))
