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


(map f (list 1 2 3)) =
; First, build the pipeline accumulator
(define (accum0 x) x) (map-iter accum0 (list 1 2 3)) =
; **First call to pam-iter**
; accum: (lambda (x) x)
; l: (list 1 2 3)
; ----
; (first l): 1
; (rest l): (list 2 3)
(define (accum1 x) (accum0 (cons (f 1) x))) (map-iter accum1 (list 2 3)) =
; **Second call to pam-iter**
; l: (list 2 3)
; accum:
; (lambda (y)
;    ((lambda (x) x)
;     (cons (f 1) y))
;  )
; ---
; (first l): 2
; (rest l): (list 3)
(define (accum2 x) (accum1 (cons (f 2) x))) (map-iter accum2 (list 3)) =
; **Third call to pam-iter**
; accum:
; (lambda (z)
;   ((lambda (y) (lambda (x) (cons (f 1) y)))
;    (cons (f 2) z)))
; l: (list 3)
(define (accum3 x) (accum2 (cons (f 3) x))) (map-iter accum3 (list)) =
; **Thid call to pam-iter:**
; accum:
; (lambda (w)
  ; (
  ;   (lambda (z)
  ;     ((lambda (y) (lambda (x) (cons (f 1) y)))
  ;     (cons (f 2) z)))
  ;   (cons (f 3) w))
  ; ))
; l: (list)
; Second, run the pipeline accumulator
(accum3 (list)) =
; (
;   (lambda (z)
;     ((lambda (y) (lambda (x) (cons (f 1) y)))
;     (cons (f 2) z)))
;   (list (f 3))))
; ))
(accum2 (list (f 3))) =
; (
;   (lambda (y) (lambda (x) (cons (f 1) y)))
;   (list (f 2) (f 3))
; )
(accum1 (list (f 2) (f 3))) =
; (
;   (lambda (x) x)
;   (list (f 1) (f 2) (f 3))
; )
(accum0 (list (f 1) (f 2) (f 3))) =
; ->
(list (f 1) (f 2) (f 3)))











;
