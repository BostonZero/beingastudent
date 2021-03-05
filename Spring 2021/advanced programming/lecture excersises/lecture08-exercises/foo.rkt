#lang racket

; Make variables a and c visible
(provide (all-defined-out))
; Original version
; (provide (a c)

; public
(define a 10)

(define b (+ a 30))

; public
(define (c x) (* b x))