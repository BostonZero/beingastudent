#lang racket
(require rackunit)

(define (lambda? node) 
(andmap symbol? node)
)




;;; 'todo





;;; )





;;; (check-false (lambda? '()))
;;; (check-false (lambda? '(lambda)))
;;; (check-false (lambda? '10))
;;; (check-false (lambda? '(define ())))
;;; (check-false (lambda? '(lambda (1) 2)))
;;; (check-true (lambda? (quote (lambda (x) x))))
;;; (check-false (lambda? (quote 3)))
;;; (check-false (lambda? '(lambda ())))
;;; (check-true (lambda? '(lambda (x) ())))
;;; (check-true (lambda? '(lambda () (+ 1 2))))
;;; (check-false (lambda? '(lambda x 10)))






