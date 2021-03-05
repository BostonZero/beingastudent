#lang racket
(define (max xs)
  (cond
    [(empty? xs) (error "max: expecting a non-empty list!")]
    [(equal? (length xs) 1) (first xs)]             ; The list only has one element (the max)
    [(> (first xs) (max (rest xs))) (first xs)] ; The max of the rest is smaller than 1st
    [else (max (rest xs))]))                    ; Otherwise, use the max of the rest
; A simple unit-test
(require rackunit)

(check-equal? 10 (max (list 1 2 10 4 0)))

(check-equal? 1000 (max (list 1 2 10 4 100 0 1000)))