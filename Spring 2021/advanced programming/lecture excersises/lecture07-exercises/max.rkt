#lang racket
(define (max xs)
  ; Compute the maximum of two elements
  (define (max-of-2 x y)
    (cond
      [(> x y) x]
      [else y]))
  ; Recursive implementation of max that uses a parameter
  ; to store the current maximum value so far
  (define (max-aux max-so-far xs)
    (cond
      [(empty? (rest xs)) (max-of-2 max-so-far (first xs))]
      [else
        ; Let me update the current maximum number so far
        (define curr-max (max-of-2 max-so-far (first xs)))
        ; Now we recurse
        (max-aux curr-max (rest xs))]))
  (cond
    [(empty? xs) (error "max: expecting a non-empty list!")]
    [else (max-aux (first xs) xs)]))


; Creates a list with 1000 elements
(define (countup-from1 to)
  (define (count from)
    (cond [(equal? from to) (list to)]
          [else (cons from (count (+ 1 from)))]))
  (count 1))

(define size 1000000)
(define l (sort (build-list size (lambda (x) (random 9999999))) <))
(require "benchmark.rkt")
(define s (benchmark (lambda () (max l))))
(printf "Processing a list of size: ~a\n" size)
(printf "Throughoutput: ~a elems/ms \n" (~r (/ size (sample-arith-mean s)) #:precision 0))
(printf "Mean: ~ams\n" (sample->string s))
