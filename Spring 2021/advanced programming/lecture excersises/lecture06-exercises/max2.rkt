#lang racket
(define (max xs)
  (cond
    [(empty? xs) (error "max: expecting a non-empty list!")]
    [(empty? (rest xs)) (first xs)]
    [else
      (define rest-max (max (rest xs)))
      (cond
        [(> (first xs) rest-max) (first xs)]
        [else rest-max])]))

; Creates a list with 1000 elements
(define (countup-from1 to)
  (define (count from)
    (cond [(equal? from to) (list to)]
          [else (cons from (count (+ 1 from)))]))
  (count 1))

(define size 100000)
(define l (sort (build-list size (lambda (x) (random 9999999))) <))
(require "benchmark.rkt")
(define s (benchmark (lambda () (max l))))
(printf "Processing a list of size: ~a\n" size)
(printf "Throughoutput: ~a elems/ms \n" (~r (/ size (sample-arith-mean s)) #:precision 0))
(printf "Mean: ~ams\n" (sample->string s))
