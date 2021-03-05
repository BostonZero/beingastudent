#lang racket

(define (member elem l)
  (cond [(empty? l) #f] ; empty
        [else             ; cons
          (or
            ; elem is the first element of the list
            (equal? (first l) elem)
            ; or, elem is in the rest of the list
            (member elem (rest l)))]))

; Unit test that tests
(require rackunit)
(check-true (member 1 (list 3 6 1)))
(check-true (member #t (list 3 #t (list))))
(check-false (member 1 (list 3 #t (list 1))))
(check-false (member #f (list)))

; Example 2

(define (match-prefix? elem l)
  (cond [(empty? l) #f]
        [else
          (or (string-prefix? (first l) elem)
              (match-prefix? elem (rest l)))]))


(check-true (string-prefix? "Racket" "R")) ; available in standard library
(check-true (match-prefix? "R" (list "foo" "Racket")))
(check-false (match-prefix? "R" (list "foo" "bar")))


(define (exists? predicate l)
  (cond [(empty? l) #f]
        [else
          (or (predicate (first l))
              (exists? predicate (rest l)))]))

(check-true (exists? (lambda (x) (string-prefix? x "R")) (list "foo" "Racket")))

(define (match-prefix?:v2 elem l)
  (exists? (lambda (x) (string-prefix? x elem)) l))


(check-true (match-prefix?:v2 "R" (list "foo" "Racket")))










;