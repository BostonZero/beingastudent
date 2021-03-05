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
;(require racket/trace)
(require "ast.rkt")
(require "hw2.rkt")
(provide (all-defined-out))

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

 