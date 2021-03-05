#lang racket
(require rackunit)

(define (count lower-bound upper-bound)
  (cond [(equal? lower-bound upper-bound) (list lower-bound)]
        [else
          (cons lower-bound (count (+ lower-bound 1) upper-bound))]))


(define (countup-from1 x)
  (count 1 x))

; Base case
; (count 2 2) -> (list 2)
; (count 1 1) -> (list 1)
(check-equal? (list 1) (count 1 1))
(check-equal? (list 2) (count 2 2))

; Recursive step
; (count 2 3) -> (list 2 3) -> (cons 2 (count 3 3)) -> (cons 2 (list 3))
(check-equal? (list 2 3) (count 2 3))


(check-equal? (list 1 2 3 4 5) (count 1 5))



; (count 1 1) -> (list 1)
; (countup-from1 1) = (list 1) -> [1]
(check-equal? (list 1) (countup-from1 1))

; (countup-from1 2) -> (list 1 2) -> (countup-from1 1) + (list 2)
; (count 2 2) -> (list 2)
; (countup-from1 2) -> (count 1 2) -> (cons 1 (count 2 2)) -> (cons 1 (list 2)) -> (list 1 2)
(check-equal? (list 1 2) (countup-from1 2))

; (countup-from1 5) -> (list 1 2 3 4 5) -> (countup-from1 4) + (list 5)
(check-equal? (list 1 2 3 4 5) (countup-from1 5))

;;; Version 2


(define (countup-from1:v2 x)
  (define (count:v2 lower-bound upper-bound)
    (cond [(equal? lower-bound upper-bound) (list lower-bound)]
          [else
            (cons lower-bound (count:v2 (+ lower-bound 1) upper-bound))]))
  (count:v2 1 x))

(check-equal? (list 1) (countup-from1:v2 1))
(check-equal? (list 1 2) (countup-from1:v2 2))
(check-equal? (list 1 2 3 4 5) (countup-from1:v2 5))


;;; Version 3


(define (countup-from1:v3 upper-bound)
  (define (count:v3 lower-bound)
    (cond [(equal? lower-bound upper-bound) (list lower-bound)]
          [else
            (cons lower-bound (count:v3 (+ lower-bound 1)))]))
  (count:v3 1))

(check-equal? (list 1) (countup-from1:v3 1))
(check-equal? (list 1 2) (countup-from1:v3 2))
(check-equal? (list 1 2 3 4 5) (countup-from1:v3 5))
























;
