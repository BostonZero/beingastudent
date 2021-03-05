#lang racket


(define (count-1-to n)
  (define (count-up-to lo)
    (cond
      [(>= lo n) (list lo)]
      [else (cons lo (count-up-to (+ lo 1)))]))

  (count-up-to 1))

; (count-1-to 10) ; creates a count-up-to n=10
; (count-1-to 20) ; creates a count-up-to n=20

(define three:1 3)
(define three:2 (lambda () 3))

; three:1
; three:2
; (three:2) ; <- We need to call the function to obtain its contents 
;           ;    Note that we are passing 0 parameters.

(define (factory n)
  (lambda () n))

(define three:3 (factory 3))

; three:3
; (three:3)

; ; You can pass different parameters, which will create a diff function
; (define four (factory 4))
; (four)

; ; But, since the return value is a function we can call it directly
; ((factory 5))



;(cons 1 3)


(define (cons l r)
  (lambda (op)
    (cond [(equal? op 'left) l]
          [(equal? op 'right) r])))

;(cons 10 20)

(define (car p)
  (p 'left))

(define (cdr p)
  (p 'right))

(require rackunit)

(define p:10-20 (cons 10 20))

; p:10-20
; (p:10-20 'left)
; (p:10-20 'right)

(check-equal? 10 (car p:10-20))
(check-equal? 20 (cdr p:10-20))

; Extending the behavior of operation 'left of a given pair
(define (add-to-left p v)
  (lambda (op)
    (cond [(equal? op 'left) (+ (p 'left) v)]
          [else (p op)])))


(define p:15-20 (add-to-left p:10-20 5))

(car p:15-20)
(cdr p:15-20)










;