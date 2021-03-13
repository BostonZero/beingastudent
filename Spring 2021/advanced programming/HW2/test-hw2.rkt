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
;;; (define (f x y z w)
;;;   (+ x y z w))
;;; (define g (uncurry (curry f)))
;;; (check-equal? 10 (g (list 1 2 3 4)))
;;; (check-equal? 13 ((uncurry (lambda () 13)) (list)))
;;; (check-equal? 13 ((uncurry (lambda (x) (+ x 3))) (list 10)))
;;; (check-equal? 13 ((uncurry (lambda (x) (lambda (y) (+ x y)))) (list 10 3)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(check-equal? (parse-ast 'x) (r:variable 'x))

(check-equal? (parse-ast '10) (r:number 10))

(check-equal?
  (parse-ast '(lambda (x) x))
  (r:lambda (list (r:variable 'x)) (list (r:variable 'x))))

(check-equal?
  (parse-ast '(define (f y) (+ y 10)))
  (r:define
    (r:variable 'f)
    (r:lambda
      (list (r:variable 'y))
      (list (r:apply (r:variable '+) (list (r:variable 'y) (r:number 10)))))))

(check-equal?
  (parse-ast '(define (f y) (+ y 10)))
  (r:define (r:variable 'f)
    (r:lambda (list (r:variable 'y))
      (list (r:apply (r:variable '+) (list (r:variable 'y) (r:number 10)))))))

(check-equal?
  (parse-ast '(define (f x y) (+ x y 10)))
  (r:define (r:variable 'f)
    (r:lambda (list (r:variable 'x) (r:variable 'y))
      (list (r:apply (r:variable '+) (list (r:variable 'x) (r:variable 'y) (r:number 10)))))))

(check-equal?
  (parse-ast '(define (f) (+ 2 3 4)))
  (r:define (r:variable 'f)
    (r:lambda '()
      (list (r:apply (r:variable '+) (list (r:number 2) (r:number 3) (r:number 4)))))))

(check-equal?
  (parse-ast '(define (f) 1))
  (r:define (r:variable 'f)
    (r:lambda '() (list (r:number 1)))))

(check-equal?
  (parse-ast '(define (f) (define x 3) x))
  (r:define (r:variable 'f)
    (r:lambda '()
      (list (r:define (r:variable 'x) (r:number 3)) (r:variable 'x)))))

(check-equal?
 (parse-ast (quote (lambda (x) (define y 10) y)))
 (r:lambda 
  (list (r:variable 'x)) 
  (list
    (r:define
      (r:variable 'y)
      (r:number 10)
    ) 
    (r:variable 'y))))
