#lang racket
(void)

(define v (void))

(and v 3)
(and v #t)
; Does this return 3, #t?
(and 3 v)
