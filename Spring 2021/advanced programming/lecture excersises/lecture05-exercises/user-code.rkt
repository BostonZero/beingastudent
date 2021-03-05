#lang racket

(require rackunit)

(define (point x y z)
  (list x y z))

(define (point? p)
  (and
    (list? p)
    (equal? (length p) 3)))

; In Java you have the camelCase
; In Python you follow the snake_style
; In racket it follows the kebab-style of casing
; (define (point-x p) (list-ref p 0))
; (define (point-y p) (list-ref p 1))
; (define (point-z p) (list-ref p 2))
(define (point-x p) (first p))
(define (point-y p) (second p))
(define (point-z p) (third p))

(define (point-set-x p x)
  (list x (point-y p) (point-z p)))
(define (point-set-y p y)
  (list (point-x p) y (point-z p)))
(define (point-set-z p z)
  (list (point-x p) (point-y p) z))

(define (origin? p)
  (equal? p (list 0 0 0)))

(define p (point 1 2 3))
(check-equal? (list 1 2 3) p)
(check-true (point? p))
(check-false (point? #t))
(check-false (point? (list)))

(check-equal? 1 (point-x p))
(check-equal? 2 (point-y p))
(check-equal? 3 (point-z p))

; persistent data-structure style of updating
(check-equal? (list 10 2 3) (point-set-x p 10))
(check-equal? (list 1 10 3) (point-set-y p 10))
(check-equal? (list 1 2 10) (point-set-z p 10))

; Is a given point at the origin?
(check-true (origin? (list 0 0 0)))
(check-false (origin? p))

















;