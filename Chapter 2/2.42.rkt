#lang racket
  
(define (accumulate op initial sequence) 
  (if (null? sequence) 
      initial 
      (op (car sequence) 
          (accumulate op initial (cdr sequence))))) 
  
(define (enumerate-interval low high) 
  (if (> low high) 
      '() 
      (cons low (enumerate-interval (+ low 1) high)))) 
  
(define (flatmap proc seq) 
   (accumulate append '() (map proc seq)))

(define (queens board-size)
  (define empty-board (list))

  (define (adjoin-position new-row k rest-of-queens)
    (cons new-row rest-of-queens))

  (define (safe? k positions)
    (define (queen-safe? queen-row rest-queen-rows k2)
      (cond ((null? rest-queen-rows) true)
            ((or (= queen-row (car rest-queen-rows))
                 (= (abs (- k k2))
                    (abs (- queen-row (car rest-queen-rows)))))
             false)
            (else (queen-safe? queen-row (cdr rest-queen-rows) (- k2 1)))))

    (queen-safe? (car positions) (cdr positions) (- k 1)))
  
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter (lambda (positions) (safe? k positions))
                (flatmap (lambda (rest-of-queens)
                           (map (lambda (new-row)
                                  (adjoin-position new-row k rest-of-queens))
                                (enumerate-interval 1 board-size)))
                         (queen-cols (- k 1))))))
  (queen-cols board-size))

(queens 6)
