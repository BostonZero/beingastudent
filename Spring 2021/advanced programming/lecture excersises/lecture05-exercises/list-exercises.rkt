#lang racket
(require rackunit)

(define (sum-list l)
  (cond [(empty? l) 0]
        ; first, rest
        [else
          (+ (first l) (sum-list (rest l)))
        ]))

; (define l (list 1 2 3 4))
; (first l)
; (rest l)

(check-equal? 10 (sum-list (list 1 2 3 4)))
(check-equal? 0 (sum-list (list)))


;;;; Example 2

(define (count-down n)
  (cond [(<= n 0) (list)]
        [else (cons n (count-down (- n 1)))]))

; (count-down n) = (cons n (count-down (- n 1)))
; (count-down 3) = (list 3 2 1) = (cons 3 (list 2 1)) = (cons 3 (count-down 2))
; (count-down 2) = (list 2 1) = (cons 2 (list 1)) = (cons 2 (count-down 1))
; (count-down 1) = (list 1) = (cons 1 (list)) = (cons 1 (count-down 0))
; (count-down 0) = (list) <- base case

(check-equal? (list) (count-down 0))
(check-equal? (list 3 2 1) (count-down 3))


;;;;;; Exmaple 3

(define (zip l r)
  (cond [(empty? l) (list)]
        [(empty? r) (list)]
        [else
          (define new-pair (cons (first l) (first r)))
          (cons new-pair (zip (rest l) (rest r))) ]))

(check-equal? (list (cons 3 30) (cons 2 20) (cons 1 10))
              (zip (list 3 2 1) (list 30 20 10)))
(check-equal? (list (cons 3 30) (cons 2 20) (cons 1 10))
              (zip (list 3 2 1) (list 30 20 10 5 4 3 2 1)))
(check-equal? (list (cons 3 30) (cons 2 20) (cons 1 10))
              (zip (list 3 2 1 90 180 270) (list 30 20 10)))

























;