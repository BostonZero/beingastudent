#lang racket

;;;;; Example 1
; (define (f x)
;   (define z 3)
;   (+ x z))
; (+ 1 z) ; Error: z is not visible outside function f

;;;;; Example 2
; (define z 10)
; (define (f x) ; x = 1
;   (define x 3) ; Shadows parameter
;   ; z = 10
;   ; x = 3
;   (define z 20)  ; Shadows global
;   ; z = 20
;   ; x = 3
;   (+ x z))

; (f 1) ; Outputs 23

; (define a 1)
; (define a (+ a 1))

; (define (f b)
;   ; OK to shadow a parameter
;   (define b (+ b 1))
;   (define a 1)
;   ; Not OK to re-define local variables
;   ; Error: define-values: duplicate binding name
;   (define a (+ a 1))
;   (+ a b))
