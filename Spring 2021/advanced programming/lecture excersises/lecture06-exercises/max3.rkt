#lang racket
(define (max xs)
  ; The maximum between two numbers
  (define (max2 x y)
    (cond [(< x y) y] [else x]))
  ; Accumulate the maximum number as a parameter of recursion
  (define (max-aux curr-max xs)
    (define new-max (max2 curr-max (first xs)))
    (cond
      [(empty? (rest xs)) new-max]
      [else (max-aux new-max (rest xs))]))
  ; Compute
  (cond
    [(empty? xs) (error "max: empty list")]
    [else (max-aux (first xs) xs)]))


; Creates a list with 1000 elements
(define (countup-from1 to)
  (define (count from)
    (cond [(equal? from to) (list to)]
          [else (cons from (count (+ 1 from)))]))
  (count 1))
; A list with 1 million entries
(define (average l)
  (define total (foldl + 0.0 l))
  (define count (length l))
  (/ total count))
(require racket/format)
(define size 1000000)
(define l (sort (build-list size (lambda (x) (random 9999999))) <))
(require "benchmark.rkt")
(printf "Processing a list of size: ~a\n" size)
(define s (benchmark (lambda () (max l))))
(printf "Throughoutput: ~a elems/ms \n" (~r (/ size (sample-arith-mean s)) #:precision 0))
(printf "Mean: ~ams\n" (sample->string s))
