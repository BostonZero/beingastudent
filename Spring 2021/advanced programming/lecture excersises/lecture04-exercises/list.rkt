#lang racket

; (list 10 20 30 40 50 60 70 80)

; (list
;   ; element 0
;   (+ 0 1)
;   ; element 1
;   (+ 0 1 2)
;   ; element 2
;   (+ 0 1 2 3))

; (list)

(define l1 (list (+ 0 1) (+ 0 1 2) (+ 0 1 2 3)))

(require rackunit)
(check-false (empty? l1))
(check-true (empty? (list)))


; Examples for rest
; l1
; (rest l1)
; (rest (rest l1))
; (rest (rest (rest l1)))
; (rest (list))



; Is the empty list '(list)' the same as 'empty'
(check-equal?
  (list)
  empty)

(check-equal?
  (list 1 2 3 4)
  (cons 1
    (cons 2
      (cons 3
        (cons 4 empty)))))


; This test must fail
; (check-equal?
;   (list 1 2 3 4)
;   (cons
;     (cons
;       (cons 
;         (cons empty 1)
;         2)
;         3)
;         4))


;; Introducing the accessor first

(check-equal?
  (first (list 1 2 3 4))
  1)


(check-equal?
  (first (list 10 20 30 40))
  10)

(check-equal?
  (car (list 10 20 30 40))
  10)

; Examples where rest and cdr return the same
(check-equal?
  (cdr l1)
  (rest l1))

; function 'rest' can only be applied to lists, not pairs
; (rest (cons 1 2))







;