#lang racket
;1/1/a


(provide (all-defined-out))

(define ex1
    (+
	    (+ 15 (+ 4 10))
	    (/ 
	    5
	    (- 6 4)))
)
;1/1/b 
(define ex2
	(list
		(+ (+ 15 (+ 4 10)) (/ 5 (- 6 4)))
        (+ (+ 15 14) (/ 5 (- 6 4)))
        (+ 29 (/ 5 (- 6 4)))
        (+ 29 (/ 5 2))
        (+ 29 5/2)
		63/2))
;1/2
(define ex3 (lambda (x y) (not (< (+ (- 12 14) x) (* (* y x) (* y x))))))

;2/3
;; Constructs a tree from two trees and a value
(define (tree left value right) 'todo)
;; Constructs a tree with a single node
(define (tree-leaf value) 'todo)

;; Accessors
(define (tree-left self) 'todo)
(define (tree-value self) 'todo)
(define (tree-right self) 'todo)

;; Copies the source and updates one of the fields
(define (tree-set-value self value) 'todo)
(define (tree-set-left self left) 'todo)
(define (tree-set-right self right) 'todo)

;; Function that inserts a value in a BST
(define (bst-insert self value) 'todo)

;; lambda
(define (lambda? node) 'todo)
(define (lambda-params node) 'todo)
(define (lambda-body node) 'todo)

;; apply
(define (apply? l) 'todo)
(define (apply-func node) 'todo)
(define (apply-args node) 'todo)

;; define
(define (define? node) 'todo)
(define (define-basic? node) 'todo)
(define (define-func? node) 'todo)
