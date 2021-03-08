#lang racket
#|
            #####################################################
            ###  PLEASE DO NOT DISTRIBUTE SOLUTIONS PUBLICLY  ###
            #####################################################

  Copy your solution of HW1 as file "hw1.rkt". The file should be in the same
  directory as "hw2.rkt" and "ast.rkt".
|#
(require "ast.rkt")
(require "hw1.rkt")
(require rackunit)
(provide (all-defined-out))
;; ^^^^^ DO NOT CHANGE ANY CODE ABOVE THIS LINE ^^^^^


;; Exercise 1.a: Counter
(define (counter accum grow) 
  (lambda (inp)
    (cond 
          [(equal? 'get inp) accum]
          [(equal? 'inc inp) (counter (grow accum) grow)]
          [else (void)])))
     


;; Exercise 1.b: Adder
(define (adder super) 
  (lambda (inp)
    (cond 
          [(equal? 'get inp) (super 'get)]
          [(equal? 'inc inp) (adder ((super 'inc) 'inc))]
          [else (void)])))
;; Exercise 2: Interperse
(define (intersperse l v) 
  (cond
      [(empty? l) l]
      [(empty? (rest l)) l]
      [else (cons (car l)
                  (cons v
                        (intersperse (cdr l) v)))]))
;; Exercise 3.a: Generic find
(define (find pred l)
 (define (dive accum func d-list) ;this will return the index value 
  (cond
   [(empty? d-list) #f]
   [(equal? (func accum (car d-list)) #t) accum]
   [else (dive (+ accum 1) func (rest d-list))]))
  
 (define var (dive 0 pred l))
 (cond 
  [(empty? l) #f] ;empty list. we leave
  [(equal? var #f) #f];post iteration yields a waste of time, we leave
  [else (cons
         var ;return index
         (list-ref l var))]));get me the element
  
;; Exercise 3.b: Member using find
(define (member x l) 
 (cond
  [(equal? #f (find (lambda (crap junk) (equal? junk x)) l)) #f]
  [else #t]))

;; Exercise 3.c: index-of using find
(define (index-of l x) 
  (define var (find (lambda (crap junk) (equal? junk x)) l))
 (cond 
  [(pair? var) (car var)]
  [else #f]))
  
  






;; Exercise 4: uncurry, tail-recursive
(define (uncurry f) 'todo)

;; Exercise 5: Parse a quoted AST
(define (parse-ast node)
  (define (make-define-func node) 'todo)
  (define (make-define-basic node) 'todo)
  (define (make-lambda node) 'todo)
  (define (make-apply node) 'todo)
  (define (make-number node) 'todo)
  (define (make-variable node) 'todo)

  (cond
    [(define-basic? node) (make-define-basic node)]
    [(define-func? node) (make-define-func node)]
    [(symbol? node) (make-variable node)]
    [(real? node) (make-number node)]
    [(lambda? node) (make-lambda node)]
    [else (make-apply node)]))
