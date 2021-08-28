#lang racket

(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (sqr tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(define (square-tree2 tree)
  (map (lambda(sub-tree)
         (if (pair? sub-tree)
             (square-tree2 sub-tree)
             (sqr sub-tree)))
       tree))

(define tree (list 1
                   (list 2 (list 3 4) 5)
                   (list 6 7)))

(square-tree tree)
(square-tree2 tree)
