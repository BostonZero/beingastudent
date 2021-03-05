#lang racket

; Exercise 1:

#|
n = 16
if n % 15 == 0:
    return "fizzbuzz"
if n % 3 == 0:
    return "fizz"
if n % 5 == 0:
    return "buzz"
return n
|#

; (define n 16) ; n = 16

; (cond [(equal? (modulo n 15) 0) "fizzbuzz"]
;       [(equal? (modulo n 3) 0) "fizz"]
;       [(equal? (modulo n 5) 0) "buzz"]
;       [else n])

; Exercise 2:

#| How many evaluation steps should we expect? |#
; Original expression, if uncommented it breaks step 1
; (define x (* 10 2))
; (+ x (* 4 2))

;------
; Step 1

(define x 20)
(+ x (* 4 2))

;------
; Step 2
; x = 100
; runtime value of #<void>
; This is invalid racket because x is undefined
; (void)
; (+ x (* 4 2))

; Step 3

(+ 20 (* 4 2))

; Step 4

(+ 20 8)

; Step 5

28
























;
