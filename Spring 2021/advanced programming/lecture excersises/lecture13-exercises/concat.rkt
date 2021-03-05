#lang racket

(require rackunit)

(define (append l r)
  (cond [(empty? l) r]
        [else
            ; l = (list 1 2)
            ; r = (list 3 4)
            ; (first l) = 1
            ; (rest l) = (list 2)
            ; recursive call result = (list 2 3 4)
            (cons (first l) (append (rest l) r))]))

(define (foldr step base-case l)
  (cond
    [(empty? l) base-case]
    [else (step (first l)
                (foldr step base-case (rest l)))]))

(define (append:v2 l r)
  (foldr cons r l))

; (append:v2 (list 1 2) (list 3 4))

(check-equal?
  (append (list) (list 1 2 3 4))
  (list 1 2 3 4))

(check-equal?
  (append (list 1) (list 2 3 4))
  (list 1 2 3 4))

(check-equal?
  (append (list 1 2) (list 3 4))
  (list 1 2 3 4))

(check-equal?
  (append (list 1 2 3) (list 4))
  (list 1 2 3 4))

(check-equal?
  (append (list 1 2 3 4) (list))
  (list 1 2 3 4))

;; -----------------------------
; Left reduction example

(define (reverse:v1 l)
  (cond [(empty? l) empty]
        [else
          ; l = (list 1 2 3 4)
          ; (first l) = 1
          ; (rest l) = 2 3 4
          ; (reverse (rest l)) = (list 4 3 2)
          ; (list (first l)) = (list 1)
          (append (reverse:v1 (rest l)) (list (first l)))]))


(define (reverse:v2 l)
  (define (reverse-iter reversed-list l)
    (cond [(empty? l) reversed-list]
          [else
            ; (reverse-iter (list 2 1) (list 3 4))
            ;
            ;  (list 1 2 [3] 4)
            ;             ^----- processing 3
            ; l = (list 3 4)
            ; reversed-list = (list 2 1)
            ; (first l) = 3
            ; (rest l) = (list 4)
            ;
            ; (reverse-iter (list 3 2 1) (list 4))
            (reverse-iter (cons (first l) reversed-list) (rest l))]))

  (reverse-iter (list) l))


(check-equal? (list) (reverse:v1 (list)))

(check-equal? (list 4 3 2 1) (reverse:v1 (list 1 2 3 4)))


(check-equal? (list) (reverse:v2 (list)))

(check-equal? (list 4 3 2 1) (reverse:v2 (list 1 2 3 4)))





; (list 1 2 3)
; "> 1, 2, 3"














;