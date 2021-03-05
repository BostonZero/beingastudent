#lang racket
(require rackunit)

(define (add3 x y z)
  (+ x y z))

(check-equal? (+ 1 3 5) (add3 1 3 5))

(define curried-add (curry add3))


(define v1 (curried-add 1))
(define v2 (v1 3))
(define v3 (v1 10))


(check-equal? (v2 5) (add3 1 3 5))

(check-equal? (v3 12) (add3 1 10 12))

(check-equal? (((curried-add 1) 3) 5) (add3 1 3 5))


; (curried-add 3)

; (curried-add 5)


; (define add10 (curried-add 10))
; (check-equal? (+ 10 30) (add10 30))
