#lang racket
(require rackunit)

(define (remove-0 l)
  (cond [(empty? l) empty]
        [(equal? (first l) 0) (remove-0 (rest l))]
        [else (cons (first l) (remove-0 (rest l)))]))

(check-equal? (list 1 3 4) (remove-0 (list 0 1 3 0 4)))
(check-equal? (list 1 2 3) (remove-0 (list 1 2 3)))

; Generalize the number being removed

(define (remove v l)
  (cond [(empty? l) empty]
        [(equal? (first l) v) (remove v (rest l))]
        [else (cons (first l) (remove v (rest l)))]))

(check-equal? (list 1 3 4) (remove 0 (list 0 1 3 0 4)))
(check-equal? (list 1 2 3) (remove 0 (list 1 2 3)))
(check-equal? (list 0 3 0 4) (remove 1 (list 0 1 3 0 4)))
(check-equal? (list 1 3) (remove 2 (list 1 2 3)))

(define (remove-0:v2 l) (remove 0 l))

(check-equal? (list 1 3 4) (remove-0:v2 (list 0 1 3 0 4)))
(check-equal? (list 1 2 3) (remove-0:v2 (list 1 2 3)))


(define (filter to-keep? l)
  (cond [(empty? l) empty]
        [(to-keep? (first l)) (cons (first l) (filter to-keep? (rest l)))]
        [else (filter to-keep? (rest l))]))

(define (remove:v2 v l)
  (filter (lambda (x) (not (equal? v x))) l))


(check-equal? (list 1 3 4) (remove:v2 0 (list 0 1 3 0 4)))
(check-equal? (list 1 2 3) (remove:v2 0 (list 1 2 3)))
(check-equal? (list 0 3 0 4) (remove:v2 1 (list 0 1 3 0 4)))
(check-equal? (list 1 3) (remove:v2 2 (list 1 2 3)))











;