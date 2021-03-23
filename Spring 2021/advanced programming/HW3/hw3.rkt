#lang errortrace racket
#|
    ===> PLEASE DO NOT DISTRIBUTE SOLUTIONS NOR TESTS PUBLICLY <===

   We ask that solutions be distributed only locally -- on paper, on a
   password-protected webpage, etc.

   Students are required to adhere to the University Policy on Academic
   Standards and Cheating, to the University Statement on Plagiarism and the
   Documentation of Written Work, and to the Code of Student Conduct as
   delineated in the catalog of Undergraduate Programs. The Code is available
   online at: http://www.umb.edu/life_on_campus/policies/code/

|#
(require rackunit)
(require "ast.rkt")
(provide (all-defined-out))

;;;;;;;;;;;;;;;;;;;;;;;
;; Utility functions ;;

(define p:empty (delay empty))
(define (p:empty? p) (empty? (force p)))
(define (p:first l) (car (force l)))
(define (p:rest l) (cdr (force l)))
(define (stream-get stream) (car stream))
(define (stream-next stream) ((cdr stream)))
(define (p:list->list p)
  (cond [(p:empty? p) empty]
        [else
          (cons
            (p:first p)
            (p:list->list (p:rest p)))]))
(define (p:list . l)
  (list->p:list l))            
(define (list->p:list l)
  (foldr (lambda (elem new-l) (delay (cons elem new-l))) (delay empty) l))            
            
            
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(struct r:bool (value) #:transparent)

;; Exercise 1
(define p:void (delay empty))

;; Exercise 2
(define p:epsilon (delay (list "")))

;; Exercise 3
(define (p:char p) (delay (list (string p))))

;; Exercise 4
(define (p:union p1 p2) 
  ;if both empty, return empty
  (cond [(and (p:empty? p1) (p:empty? p2)) (delay empty)]
  ;if p1 empty, recurse with switched
   [(and (p:empty? p1) (not (p:empty? p2))) (p:union p2 p1)]
  ;else add p1 and recurse switched
   [else (delay (cons (p:first p1) (p:union p2 (p:rest p1))))]))

;; Exercise 5
(define (p:prefix s p) 
 (cond [(p:empty? p) (delay empty)]
       [else (delay (cons 
                     (string-append s (p:first p))
                     (p:prefix s (p:rest p))))]))

;; Exercise 6
(define (p:cat p1 p2)
  (define (bigstitch p1 p2 clone-p2)
   (cond
     [(p:empty? p1) (delay empty)] ;do not recurse
     [(p:empty? p2) (bigstitch (p:rest p1) clone-p2 clone-p2)] ;new set condition
     [else (delay (cons ;continue
                     (string-append (p:first p1) (p:first p2))
                     (bigstitch p1 (p:rest p2) clone-p2)))])) 

(bigstitch p1 p2 p2))
;; Exercise 7
(define (p:star union pow p) 'starfail)

;; Exercse 8
(define (stream-foldl f a s) 
    (define (sfhelper accum f s)  
        (thunk (cons 
                accum
                (sfhelper 
                  (f (stream-get s) accum) 
                  f 
                  (stream-next s)))))
    ((sfhelper a f s)))


;; Exercise 9
(define (stream-skip n s)    
  (define (sskiphelper accum strm)
       (thunk
          (cons 
             (+ accum (stream-get strm))
             (sskiphelper accum (stream-next strm)))))
  ((sskiphelper n s)))



;; Exercise 10
(define (r:eval-builtin sym)
  (cond [(equal? sym '+) +]
        [(equal? sym '*) *]
        [(equal? sym '-) -]
        [(equal? sym '/) /]
        [else #f]))



(define (r:eval-exp exp)
  (cond
    ; 1. When evaluating a number, just return that number
    [(r:number? exp) (r:number-value exp)]
    ; 2. When evaluating an arithmetic symbol,
    ;    return the respective arithmetic function
    [(r:variable? exp) (r:eval-builtin (r:variable-name exp))]
    ; 3. When evaluating a function call evaluate each expression and apply
    ;    the first expression to remaining ones
    [(r:apply? exp)
     ((r:eval-exp (r:apply-func exp))
      (r:eval-exp (first (r:apply-args exp)))
      (r:eval-exp (second (r:apply-args exp))))]
    [(r:bool? exp) (r:bool-value exp)]    
    
    
    [else (error "Unknown expression:" exp)]))

   


;do order
;;; - =r:bool=
;;; - =p:void=, =p:epsilon=, =p:char=
;;; - =stream-skip=, =p:cat=, =p:union=, =p:prefix=
;;; - =stream-fold= 
;;; - eval
;;; - p:star
