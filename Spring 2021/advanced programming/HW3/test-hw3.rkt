#lang errortrace racket
#|
            ######################################################
            ###  PLEASE DO NOT DISTRIBUTE TEST CASES PUBLICLY  ###
            ###         SHARING IN THE FORUM ENCOURAGED        ###
            ######################################################

  You are encouraged to share your test cases in the course forum, but please
  do not share your test cases publicly (eg, GitHub), as that stops future
  students from learning how to write test cases, which is a crucial part of
  this course.
|#
(require rackunit)
(require racket/set)
(require "ast.rkt")
(require "hw3.rkt")


(require rackunit)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PROMISE LISTS

;;;;;;;;;;;;;;;;;;;;;;;;;;
; Utility function: p:list?
; Checks if the given value is a promise-list.
;
(define (p:list? p)
  (cond [(promise? p)
          (define l (force p))
          (cond [(empty? l) #t]
                [(pair? l) (p:list? (cdr l))])]
        [else #f]))

;;;;;;;;;;;;;;;;;;;;;;;;;;
; The empty promise list
;
; The simplest promise list is the empty one:

(define p:empty (delay empty))

(check-true (p:list? p:empty))

; A promise list interleaves promises between each cons:
(define l1
  (delay
    (cons 1
      (delay
        (cons 2
          (delay
            (cons 3
              (delay empty))))))))

; l1 is therfore a promise list
(check-true (p:list? l1))

; Note that when we say promise-list we are *NOT* referring to a promise holding
; a list. Thus, this test must fail.
(check-false (p:list? (delay (list 1 2 3))))

;;;;;;;;;;;;;;;;;;;;;;;;;;
; Returns the first element of a promise list (assumes the promise-list is not
; empty)

(define (p:first l)
  (car (force l)))

; The first works as expected
(check-equal? (p:first l1) 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;
; Utility function: p:empty
;
; We can now define the notion of empty? like we have for lists
(define (p:empty? p)
  (and
    (promise? p)
    (empty? (force p))))
; The empty promise list is empty
(check-true (p:empty? p:empty))
; The promise list l1 is not a list
(check-false (p:empty? l1))

;;;;;;;;;;;;;;;;;;;;;;;;;;
; Returns the rest of a promise-list

; Similarly, we can define the notion of 'rest' for pormise lists
(define (p:rest l)
  (cdr (force l)))

;;;;;;;;;;;;;;;;;;;;;;;;;;
; Utility function to convert a promise-list into an unordered set
; WARNING: if you give it an infinite promise-list, the code will hang.
;
; For debugging purposes, we can convert a promise list into a regular list
(define (p:list->set p)
  (cond [(p:empty? p) (set)]
        [else
          (set-add
            (p:list->set (p:rest p))
            (p:first p))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;
; Utility function to convert a promise-list into an unordered set
; WARNING: if you give it an infinite promise-list, the code will hang.
;
; For debugging purposes, we can convert a promise list into a regular list
(define (p:list->list p)
  (cond [(p:empty? p) empty]
        [else
          (cons
            (p:first p)
            (p:list->list (p:rest p)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;
; For debugging purposes, we cab convert the first N elements of a promise list
; to an unordered set. This function is crucial when the promise list is
; infinite (eg, p:star).
(define (p:take n p)
  (cond [(or (p:empty? p) (<= n 0)) (set)]
        [else
          (set-add
            (p:take (- n 1) (p:rest p))
            (p:first p))]))


;;;;;;;;;;;;;;;;;;;;;;;;;;
; For debugging purposes, we can convert a list into a promise list
(define (list->p:list l)
  (foldr (lambda (elem new-l) (delay (cons elem new-l))) (delay empty) l))


;;;;;;;;;;;;;;;;;;;;;;;;;;
; For debugging purposes, we can create a promise list as we create regular lists
; Note that this function performs eager evaluation!
(define (p:list . l)
  (list->p:list l))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;
; The power function is exemplified below.
; This function is needed to test Exercise 7
;
(define (p:pow p n)
  (cond [(<= n 0) (force p:epsilon)]
        [else (p:cat p (p:pow p (- n 1)))]))

; Input: {a, b}

; Power of 0: every string that contains 'a' and 'b' of length 0
(check-equal?
  (p:list->set (p:pow (p:list "a" "b") 0))
  (set ""))

; Power of 1: every string that contains 'a' and 'b' of length 1
(check-equal?
  (p:list->set (p:pow (p:list "a" "b") 1))
  (set "a" "b"))

; Power of 2: every string that contains 'a' and 'b' of length 2
(check-equal?
  (p:list->set (p:pow (p:list "a" "b") 2))
  (set "aa" "ba" "ab" "bb"))

; Power of 3: every string that contains 'a' and 'b' of length 3
(check-equal?
  (p:list->set (p:pow (p:list "a" "b") 3))
  (set "aaa" "baa" "aba" "bba" "aab" "bab" "abb" "bbb"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Exercise 1
(check-equal?
  (set)
  (p:list->set p:void))

; Exercise 2
(check-equal?
  (set "")
  (p:list->set p:epsilon))

; Exercise 3
(check-equal?
  (set "a")
  (p:list->set (p:char #\a)))

; Exercise 4

(check-equal?
  (p:list->set (p:union (p:list "a" "b" "c") (p:list "d" "e" "f")))
  (set "a" "b" "c" "d" "e" "f"))

(check-equal?
  (p:list->set (p:union p:void (p:list "d" "e" "f")))
  (set "d" "e" "f"))

(check-equal?
  (p:list->set (p:union (p:list "a" "b" "c") p:void))
  (set "a" "b" "c"))

(check-equal?
  (p:list->set (p:union p:epsilon (p:list "d" "e" "f")))
  (set "" "d" "e" "f"))

; Although you mush show that the two sets are interleaved, you can
; choose to start with the left-hand side or with the right-hand side.
;
; MAKE SURE YOU PASS ONE OF THESE TESTS. YOU CANNOT PASS BOTH
;
; (check-equal?
;   (p:list->list (p:union (p:list "a" "b" "c") (p:list "d" "e" "f")))
;   (list "a" "d" "b" "e" "c" "f"))
; (check-equal?
;   (p:list->list (p:union (p:list "a" "b" "c") (p:list "d" "e" "f")))
;   (list "d" "a" "e" "b" "f" "c"))



; Exercise 5: prefix every string in the promise-list with a given string
(check-equal?
  (p:list->set (p:prefix "x" (p:list "a" "b" "c")))
  (set "xa" "xb" "xb" "xc")
)

; Exercise 6: prefix every string in the left-hand side with every string
; of the right-hand side.
(check-equal?
  (p:list->set (p:cat (p:list "x" "y") (p:list "a" "b" "c")))
  (set "xa" "xb" "xc" "ya" "yb" "yc")
)

; Exercise 7
; If we range over the first 100 elements, we should find at least these
; elements
(check-equal?
  (set-subtract
    (set "" "a" "b" "ab" "ba" "aa" "bb")
    (p:take 100 (p:star p:union p:pow (p:list "a" "b")))
  )
  (set)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; STREAMS

;; Exercise 3

; Retrieves the current value of the stream
(define (stream-get stream) (car stream))
; Retrieves the thunk and evaluates it, returning a thunk
(define (stream-next stream) ((cdr stream)))


(define (naturals)
  (define (naturals-iter n)
    (thunk
      (cons n (naturals-iter (+ n 1)))))
  ((naturals-iter 0)))

(define (ex1)
  (define s (stream-foldl cons empty (naturals)))
  (check-equal? (stream-get s) empty)
  (check-equal? (stream-get (stream-next s)) (list 0))
  (check-equal? (stream-get (stream-next (stream-next s))) (list 1 0))
  (check-equal? (stream-get (stream-next (stream-next (stream-next s)))) (list 2 1 0)))
(ex1)

(define (ex2)
  (define s (stream-skip 10 (naturals)))
  (check-equal? (stream-get s) 10)
  (check-equal? (stream-get (stream-next s)) 11)
  (check-equal? (stream-get (stream-next (stream-next s))) 12))
(ex2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EVALUATION

;; Exercise 10.b
(check-equal? (r:eval-exp (r:bool #t)) #t)
(check-equal? (r:eval-exp (r:bool #f)) #f)
(check-equal? (r:eval-exp (r:variable '+)) +)
;; Exercise 10.c
(check-true (r:eval-exp (r:apply (r:variable 'and) (list (r:bool #t) (r:bool #t)))))
(check-false (r:eval-exp (r:apply (r:variable 'and) (list (r:bool #t) (r:bool #f)))))
(check-equal?
  (r:eval-exp
    (r:apply (r:variable 'and)
      (list
        (r:bool #t)
        (r:bool #t)
        (r:apply (r:variable '+) (list (r:number 2) (r:number 3))))))
  5)

(check-equal? (r:eval-exp (r:apply (r:variable '+) (list (r:number 1) (r:number 2) (r:number 3)))) 6)
(check-equal?
  (r:eval-exp
    (r:apply (r:variable 'and)
      (list (r:bool #t) (r:number 2) (r:number 3))))
  3)

(check-true (r:eval-exp (r:apply (r:variable 'and) (list (r:bool #t) (r:bool #t)))))
(check-false (r:eval-exp (r:apply (r:variable 'and) (list (r:bool #t) (r:bool #f)))))

(check-equal?
  (r:eval-exp
    (r:apply (r:variable '+)
      (list (r:number 1) (r:number 2) (r:number 3))))
  6)
(check-equal?
  (r:eval-exp
    (r:apply (r:variable 'and)
      (list (r:bool #t) (r:number 2) (r:number 3))))
  3)