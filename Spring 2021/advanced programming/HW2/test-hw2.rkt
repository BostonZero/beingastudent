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
(require "ast.rkt")
(require "hw2.rkt")

;;;;;;;;;;;;;;;;
; Exercise 4
(define (f x y z w)
  (+ x y z w))
(define g (uncurry (curry f)))
(check-equal? 10 (g (list 1 2 3 4)))
(check-equal? 13 ((uncurry (lambda () 13)) (list)))
(check-equal? 13 ((uncurry (lambda (x) (+ x 3))) (list 10)))
(check-equal? 13 ((uncurry (lambda (x) (lambda (y) (+ x y)))) (list 10 3)))
