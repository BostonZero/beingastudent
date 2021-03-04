#lang racket
#|
            ######################################################
            ###  PLEASE DO NOT DISTRIBUTE TEST CASES PUBLICLY  ###
            ###         SHARING IN THE FORUM ENCOURAGED        ###
            ######################################################

  You are encouraged to share your test cases in the course forum, but please
  do not share your test cases publicly (eg, GitHub), as that stops future
  students from learning how to write test cases, which is a crucial part of
  this course.
|#
(require rackunit)
;(require "ast.rkt")
;(require "hw2.rkt")
(provide (all-defined-out))
;; ^^^^^ DO NOT CHANGE ANY CODE ABOVE THIS LINE ^^^^^


;; Exercise 1.a: Counter
(define (counter accum grow) 
  (lambda (inp)
    ; (print 'inpval)
    ; (print inp)
    ; (print 'growval)
    ; (print (quote grow))
    (cond 
          [(equal? 'get inp) accum]
          [(equal? 'inc inp) (counter (grow accum) grow)]
          [else (void)]
    )) 
)

;; Exercise 1.b: Adder
(define (adder super) 
  (lambda (inp)
    (cond 
          [(equal? 'get inp) ( super 'get)]
          [(equal? 'inc inp)(( super 'inc) 'inc)]
          [else (void)]
    )) 



)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;
; Exercise 1.a
; These are just utility functions
(define (counter-get c) (c 'get))
(define (counter-inc c) (c 'inc))

; A numeric counter
(define (int-counter n) (counter n (curry + 1)))

(define c1 (int-counter 10)) ; Create a new counter
(define c2 (counter-inc c1)) ; Increment the counter once
(define c3 (counter-inc c2)) ; Increment the counter again
; A counter that appends dots
(define str-counter (counter "" (curry string-append ".")))

(define d1 str-counter) ; Create a new counter
(define d2 (counter-inc d1)) ; Increment the counter once
(define d3 (counter-inc d2)) ; Increment the counter again
;;;;;;;;;;;;;;
; Exercise 1.b

(define a1 (adder c1))
(define a2 (counter-inc a1))
(define a3 (counter-inc a2))

(check-equal? 10 (counter-get a1))
(check-equal? 12 (counter-get a2))
(check-equal? 14 (counter-get a3))

