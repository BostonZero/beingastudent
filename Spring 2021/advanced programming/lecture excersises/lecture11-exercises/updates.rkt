#lang racket

(require rackunit)
; Supplied by the stdlib
(check-equal? 3 (exact-floor 3.14))
(check-equal? 3 (exact-floor 3.60))

(define (list-exact-floor l)
  (cond [(empty? l) empty]
        [else
          ; (list 1.1 2.6 3.0)
          (define h (first l))
          ; h = 1.1
          (define new-h (exact-floor h))
          ; new-h = 1
          (define t (rest l))
          ; t = (list 2.6 3.0)
          (define new-list (list-exact-floor t))
          ; new-list = (list 2 3)
          (cons new-h new-list)]))

(check-equal?
  (list 1 2 3)
  (list-exact-floor (list 1.1 2.6 3.0)))

(check-equal?
  (list 1 3 3)
  (list-exact-floor (list 1.1 3.6 3.0)))


(define (map f l)
  (cond [(empty? l) empty]
        [else
          ; (list 1.1 2.6 3.0)
          (define h (first l))
          ; h = 1.1
          (define new-h (f h))
          ; new-h = 1
          (define t (rest l))
          ; t = (list 2.6 3.0)
          (define new-list (map f t))
          ; new-list = (list 2 3)
          (cons new-h new-list)]))

(check-equal?
  (list 1 2 3)
  (map exact-floor (list 1.1 2.6 3.0)))

(check-equal?
  (list 1 3 3)
  (map exact-floor (list 1.1 3.6 3.0)))


(map (lambda (x) (* x 2)) (list 1.1 3.6 3.0))

; --------------------------------------------
; Tail recursive map

#|
(define (map f l)
  (cond [(empty? l) l]
        [else (cons (f (first l)) (map f (rest l)))]))
|#

#|

for x in 0 ... N {
  sum += A[x]
}

|#

(define (pam f l)
  (define (pam-iter accum l)
    (cond [(empty? l) accum]
          [else
            (pam-iter
              (cons (f (first l)) accum)
              (rest l))] ))
  (pam-iter (list) l))


(pam (lambda (x) (* x 2)) (list 1.1 3.6 3.0))


(define (map:v2 f l)
  (define (pam-iter accum l)
    (cond [(empty? l) (accum empty)]
          [else
            (pam-iter
              (lambda (new-list)
                (accum (cons (f (first l)) new-list)))
              (rest l)) ]  ))
  (pam-iter (lambda (x) x) l))


(map:v2 (lambda (x) (* x 2)) (list 1.1 3.6 3.0))
















;
