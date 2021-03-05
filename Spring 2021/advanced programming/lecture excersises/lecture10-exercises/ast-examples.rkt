#lang racket

(require "ast.rkt")

(r:number 10)    ; 10
(r:void)         ; (void)
(r:lambda (list) ; (lambda () 10)
  (list (r:number 10)))

; (lambda (x y z) 1 2 3)

(r:lambda
  ; Lambda parameters
  (list
   (r:variable 'x)
   (r:variable 'y)
   (r:variable 'z))
  ; Lambda body
  (list
    (r:number 1)
    (r:number 2)
    (r:number 3)))
; x
(r:variable 'x)
; (f 10)
(r:apply
  ; Function itself
  (r:variable 'f)
  ; Function arguments
  (list (r:number 10)))

; (f)
(r:apply
  ; Function itself
  (r:variable 'f)
  ; Function arguments
  (list))

; ((factory 10))
(r:apply
  ; Function itself
  (r:apply
    ; Function itself
    (r:variable 'factory)
    ; Function arguments
    (list (r:number 10)))
  ; Function arguments
  (list))















;