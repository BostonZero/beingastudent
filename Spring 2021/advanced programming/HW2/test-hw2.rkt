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

; Exercise 2
(check-equal? (list 1 0 2 0 3) (intersperse (list 1 2 3) 0))
; In this case we are adding a symbol instead of a number:
(check-equal? (list 1 'x 2) (intersperse (list 1 2) 'x))

; To interperse we need to have at least 2 elements in the list
(check-equal? (list 1) (intersperse (list 1) 9))
(check-equal? empty (intersperse empty 10))

