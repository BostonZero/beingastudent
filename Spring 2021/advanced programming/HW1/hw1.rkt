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
(define (ex3 x y)
        (>= (+ (- 12 14) x)
           (* (* y x) (* y x))
           ))
;2/3

;; Constructs a tree from two trees and a value
(define (tree left value right) 
	(list left value right))
;; Constructs a tree with a single node
(define (tree-leaf value) 
	(list '() value '()))

;; Accessors
(define (tree-left self) (list-ref self 0))
(define (tree-value self) (list-ref self 1))
(define (tree-right self) (list-ref self 2))

;; Copies the source and updates one of the fields
(define (tree-set-value self value) (tree (tree-left self) value (tree-right self)))
(define (tree-set-left self left) (tree left (tree-value self) (tree-right self)))
(define (tree-set-right self right) (tree (tree-left self) (tree-value self) right))

;; Function that inserts a value in a BST
(define (bst-insert self value) 
	(cond
		[(empty? self) (tree-leaf value)];;empty, make a leaf
		[(equal? (tree-value self) value) self];;correct value already exists, return self
		[(< value (tree-value self)) (tree 
										(bst-insert (tree-left self) value) 
										(tree-value self) 
										(tree-right self))];;less than val
		[(> value (tree-value self)) (tree
										(tree-left self) 
										(tree-value self) 
										(bst-insert (tree-right self) value))];;greater than val
	)
)
;; lambda
(define (lambda? node) 
	(and 
		(not (empty? node))
        (list? node)
		(equal? (list-ref node 0) 'lambda)
		(list? (rest node))
        (not (empty? (rest node)))
        (andmap symbol? (lambda-params node))
        (not (empty? (rest (rest node))))
		(not (empty? (lambda-body node)))
	)
)


(define (lambda-params node)
  (list-ref node 1)
  
)
(define (lambda-body node)
  (rest (rest node))
)

;; apply
(define (apply? l) 'todo)
(define (apply-func node) 'todo)
(define (apply-args node) 'todo)

;; define
(define (define? node) 
		(or
			(define-basic? node)
			(define-func? node)
		)
)
(define (define-basic? node) 
	(and
		(not (empty? node))
        (list? node)
		(equal? (list-ref node 0) 'define)
		(not (empty? (rest node)))
		(list? (rest node))
	
	

	)
)
(define (define-func? node) 	
	(and
		(not (empty? node))
        (list? node)
		(equal? (list-ref node 0) 'define)
		(not (empty? (rest node)))
		(list? (list-ref node 1))
		(not (empty? (rest (rest node))))
	

	)
)

