#lang racket

(struct frozen (func arg1) #:transparent)

(define (apply2 fr arg2)
  (define func (frozen-func fr))    ; Bind a function to a local variable
  (define arg1 (frozen-arg1 fr))
  (func arg1 arg2))                  ; Call a function bound to a local variable

(define frozen-double (frozen * 2)) ; Store function '*' in a data structure

;frozen-double

(define (double x) (apply2 frozen-double x))


(require rackunit)
(check-equal? (* 2 3) (double 3))
; Step by step execution of (double 3)
; (double 3)
; -> (apply2 frozen-double 3)
; -> (apply2 (frozen * 2) 3)
; -> (define func (frozen-func (frozen * 2)))
;    (define arg1 (frozen-arg1 (frozen * 2)))
;    (func arg1 3)
; -> (define func *))
;    (define arg1 (frozen-arg1 (frozen * 2)))
;    (func arg1 3)
; -> (define arg1 (frozen-arg1 (frozen * 2)))
;    (* arg1 3)
; -> (define arg1 2)
;    (* arg1 3)
; -> (* 2 3)
; -> 6

;;;;;;;;;;;;;;;;;;
; Example 2

(define (plus1 x) (+ x 1))

; A list with two functions:
; * doubles a number
; * increments a number
(define p (list double plus1))

; p

; Applies each function to a value
; (pipeline (list double plus1) 10)
; -> (double (pipeline (list plus1) 10))
; -> (double (plus1 (pipeline (list) 10)))
; -> (double (plus1 10))

(define (pipeline funcs init-value)
  (cond [(empty? funcs) init-value]
        [else
          (define curr-func (first funcs))
          (define new-funcs (rest funcs))
          (curr-func (pipeline new-funcs init-value))]))


; ; Run the pipeline
(check-equal? (double (plus1 3)) (pipeline p 3))

;-------------------------------
; Creating functions dynamically
; Objective: freeze a binary function

(define (frozen-* arg1)
  (define fr (frozen * arg1))
  (lambda (arg2)
    (apply2 fr arg2)))

(define fr-3 (frozen-* 3))
;fr-3 ;  (define fr (frozen * 3))
      ;  (lambda (arg2)
      ;    (apply2 fr arg2))
      ; ->
      ;  (lambda (arg2)
      ;    (apply2 (frozen * 3) arg2))

;(fr-3 2)
; (apply2 (frozen * 3) 2)

; (fr-3 10)
; (apply2 (frozen * 3) 10)

(define (frozen-*:v2 arg1)
  (lambda (arg2)
    (* arg1 arg2)))



(define fr-3:v2 (frozen-*:v2 3))

(check-equal? (fr-3 2) (fr-3:v2 2))
(check-equal? (fr-3 10) (fr-3:v2 10))

(define fr-10 (frozen-* 10))

(check-equal? 100 (fr-10 10))
(check-equal? 30 (fr-3 10))

(define (freeze f)
  (define (get-arg1 arg1)
    (define (get-arg2 arg2)
      (f arg1 arg2))
    get-arg2)
  get-arg1)

(define frozen-plus (freeze +))
(define ten-plus (frozen-plus 10))

(check-equal? 12 (ten-plus 2))





; (define frozen-*:v3 (curry *))
; (define double:v3 (frozen-*:v3 2))
; (check-equal? (* 2 3) (double:v3 3))












;