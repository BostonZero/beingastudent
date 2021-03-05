#lang racket
(require rackunit)

; Declaring a struct
(struct point (x y z) #:transparent)

(define pt (point 1 2 3))
;pt
(check-true (point? pt))
(check-false (point? 10))
(check-false (point?  (quote (point 1 2 3))))
(check-equal? 1 (point-x pt))  ; the accessor point-x is automatically defined
(check-equal? 2 (point-y pt))  ; the accessor point-y is automatically defined

; Creating the name data strucutre
(struct name (first middle last))
(define n (name "John" "M" "Smith"))
(check-equal? "John" (name-first n))
(check-true (name? n))   ; We have predicates that test the type of the value


(check-false (point? n)) ; A name is not a point
(check-false (list? n))  ; A name is not a list

; (point-x n) ;; Throws an exception
; point-x: contract violation
;   expected: point?
;   given: #<name>)


(struct r:void () #:transparent)
(struct r:number (value) #:transparent)
(struct r:lambda (params body) #:transparent)

(define (r:value? v)
  (or (r:number? v)
      (r:void? v)
      (r:lambda? v)))

















;