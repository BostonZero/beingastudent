#lang racket
; A simple pair creation
; (cons 1 2)
; ; Expressions are evaluated as any normal function call
; (cons
;   (+ 2 3)
;       (* 10 20))
; ; Nesting pairs
; (cons
;   (cons 1 (+ 2 3))
;   (* 10 20))

; Define a pair

; (define p
;   (cons
;     (cons 1 (+ 2 3))
;     (* 10 20)))

; (car p) ; returns the first element
; (cdr p) ; returns the second element

; Paste this at the end of "pairs.rkt"
(require rackunit)

(define (pair-swap p)
  (cons (cdr p) (car p)))

; Test 1
(check-equal?
  (cons 2 1)  ; Here is the expected value
  ; A call to the function we want to test
  (pair-swap (cons 1 2)))

(define (pair+ l r)
  (cons
    (+ (car l) (car r))
    (+ (cdr l) (cdr r))))

; Test 2
(check-equal?
  (cons 4 6)
  (pair+ (cons 1 2) (cons 3 4)))

; Test 3
; (define (pair< l r)
;   (cond [(< (car l) (car r)) #t]
;         [(> (car l) (car r)) #f]
;         [(equal? (car l) (car r))  (< (cdr l) (cdr r))])) ; Returns a boolean

(define (pair< l r)
  (or (< (car l) (car r))
      (and (= (car l) (car r))
           (< (cdr l) (cdr r)))))

(check-true (pair< (cons 1 3) (cons 2 3))) ; first branch
(check-true (pair< (cons 1 2) (cons 1 3))) ; third branch
(check-false (pair< (cons 1 3) (cons 1 3))) ; third branch
(check-false (pair< (cons 1 3) (cons 1 0))) ; third branch
(check-false (pair< (cons 3 3) (cons 3 2))) ; third branch
(check-false (pair< (cons 3 3) (cons 2 3))) ; second branch







;