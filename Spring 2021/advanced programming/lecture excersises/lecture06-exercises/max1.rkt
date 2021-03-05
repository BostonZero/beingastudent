#lang racket
(define (max xs)
  (cond
    [(empty? xs) (error "max: expecting a non-empty list!")]
    [(empty? (rest xs)) (first xs)]
    [(> (first xs) (max (rest xs))) (first xs)]
    [else (max (rest xs))]))

; (max (list 30 20 1))
; in the branch - (max (list 20 1))
;                  |- (max (list 1))
                     ; (first (list 1))
;               | (first (list 20 1))
; (first (list 30 20 1))

; (max (list 20 30 1))
; in the branch - (max (list 30 1))
;                  |- (max (list 1))
                     ; (first (list 1))
;               | (first (list 30 1))
; (max (list 30 1))
;                  |- (max (list 1))
                     ; (first (list 1))
;               | (first (list 30 1))


; Creates a list with 1000 elements
(define (countup-from1 to)
  (define (count from)
    (cond [(equal? from to) (list to)]
          [else (cons from (count (+ 1 from)))]))
  (count 1))
; A list with 1 million entries
(require rackunit)
(check-equal? 10 (max (list 1 2 10 4 0)))

; We sort the list so that we get the worst case
(define size 21)

(define l (sort (build-list size (lambda (x) (random 9999999))) <))
(require "benchmark.rkt")
(define s (benchmark (lambda () (max l))))
(printf "Processing a list of size: ~a\n" size)
(printf "Throughoutput: ~a elems/ms \n" (~r (/ size (sample-arith-mean s)) #:precision 1))
(printf "Mean: ~ams\n" (sample->string s))
