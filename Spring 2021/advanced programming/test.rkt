#lang racket
(define l1 (list 1 2 4 8 16 32 64))
(define l2 (list 1 2 3 4 5 6 7))
(require rackunit)
(define (point x y z)
    (list x y z))

(define p (point 1 2 3))

(list-ref p 2)

(quote (lambda 1 1 1))