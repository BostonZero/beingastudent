#lang racket

(require "hw1.rkt")
(require rackunit)

; 3)
(define bst7 (tree-leaf 7))
(check-equal? bst7 (list null 7 null))
(define bst76 (bst-insert bst7 6))
(check-equal? bst76 (tree (tree-leaf 6) 7 null))
(define bst768 (bst-insert bst76 8))
(check-equal? bst768 (tree (tree-leaf 6) 7 (tree-leaf 8)))
(define bst7685 (bst-insert bst768 5))
(check-equal? bst7685 (tree (tree (tree-leaf 5) 6 null) 7 (tree-leaf 8)))
(check-equal? (bst-insert bst7685 7) bst7685)
(quote ayo)
