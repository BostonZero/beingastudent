#lang racket
(define pi 3.14159)
(define circumference (lambda (radius) (* 2 pi radius)))
(circumference 2)

;; Step 1

((lambda (radius) (* 2 pi radius))
  2)

;; Step 2
(* 2 pi 2)

;; Step 3
(* 2 3.14159 2)

;;
12.56636

;;

(define (circumference2 radius) (* 2 pi radius))

(circumference2 2)
