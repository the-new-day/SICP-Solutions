#lang sicp

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Недостаточно денег на счете"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch call-password m)
    (cond ((not (= call-password password)) (error "Неверный пароль"))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Неизвестный вызов -- MAKE-ACCOUNT"
                       m))))
  dispatch)

(define acc (make-account 100 '123))

((acc '123 'withdraw) 10)
((acc '123 'deposit) 20)
