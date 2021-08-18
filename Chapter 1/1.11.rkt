#lang racket

(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
         (f-recursive (- n 2))
         (f-recursive (- n 3)))))

; How I found out how to make an iterative process

; f(4) = f(3) + f(2) + f(1)
; Let 1st term = a, 2nd term = b, 3rd term = c
; f(4) = a + b + c

; f(5) = f(4) + f(3) + f(2)
; Here a = f(4) = prev a + prev b + prev c
;     b = f(3) = prev a
;     c = f(2) = prev b

; So, on each new step a = prev a + prev b + prev c
;                      b = prev a
;                      c = prev b

(define (f-iter n)
  (define (iter a b c cnt)
    (cond ((< n 3) n)
          ((= cnt n) a)
          (else (iter (+ a b c) a b (+ cnt 1)))))
  
  ; we skip 3 iterations by setting cnt to 2
  ; (no need to check f(2), f(1) and f(0)
  (iter 2 1 0 2))
