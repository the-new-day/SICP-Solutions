#lang sicp

(define (call-the-cops) (error "I'm calling the police!"))

(define (make-account balance password)
  (let ((wrong-attempts 0))
    (define (withdraw amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Недостаточно денег на счете"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (dispatch call-password m)
      (cond ((= wrong-attempts 7) (call-the-cops))
            ((not (= call-password password))
             (begin (set! wrong-attempts (+ wrong-attempts 1))
                    (lambda (x) "Неверный пароль")))
            ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Неизвестный вызов -- MAKE-ACCOUNT"
                         m))))
    dispatch))

(define acc (make-account 100 '123))

((acc '123 'withdraw) 10)
((acc '123 'deposit) 20)

((acc '1234 'deposit) 20)
((acc '1234 'deposit) 20)
((acc '1234 'deposit) 20)
((acc '1234 'deposit) 20)
((acc '1234 'deposit) 20)
((acc '1234 'deposit) 20)
((acc '1234 'deposit) 20)
((acc '1234 'deposit) 20)

