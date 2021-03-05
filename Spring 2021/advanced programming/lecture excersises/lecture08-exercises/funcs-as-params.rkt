#lang racket
(require rackunit)

; Function that doubles the input
(define (double n) (* 2 n))

(check-equal? (double 10) 20)
(check-equal? (double 20) 40)
(check-equal? (double 21) 42)

(define (monotonic? f x)
  (>= (f x) x))

(define (add+1 n) (+ 1 n))
(define (sub-1 n) (- 1 n))

(check-true (monotonic? double 10))
(check-true (monotonic? add+1 10))
(check-false (monotonic? sub-1 10))

; ;; Tests
; (check-true (monotonic? double 3))
; (check-false (monotonic? (lambda (x) (- x 1)) 3))

; How you derive apply-n
; (apply-n f 3 x) ->
; (f (apply-n f 2 x)) ->
; (f (f (apply-n f 1 x))) ->
; (f (f (f (apply-n f 0 x)))) ->
; (f (f (f x)))

; Version 1: (not tail-call optimized)
(define (apply-n:1 f n x)
  (cond [(<= n 0) x]
        [else (f (apply-n:1 f (- n 1) x))]))

; Version of the slides: (tail call optimized)
(define (apply-n:2 f n x)
  (cond [(<= n 0) x]
        [else (apply-n:2 f (- n 1) (f x))]))

;; Tests
(check-equal? 1 (apply-n:1 double 0 1))
(check-equal? (* 2 1) (apply-n:1 double 1 1))
(check-equal? (* 2 (* 2 (* 2 1))) (apply-n:1 double 3 1))
(check-equal? (+ 3 (+ 3 (+ 3 1))) (apply-n:1 (lambda (x) (+ 3 x)) 3 1))

(check-equal? (* 2 (* 2 (* 2 1))) (apply-n:2 double 3 1))
(check-equal? (+ 3 (+ 3 (+ 3 1))) (apply-n:2 (lambda (x) (+ 3 x)) 3 1))
