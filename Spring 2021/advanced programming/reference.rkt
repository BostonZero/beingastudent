#lang racket
;reference

(expt 2 3)                  ;this is 2^3
(sin 3)                     ;sin(3)
(sin (expt 2 3))            ;sin(2^3)
(+ 2 3)                     ;2+3
(* 2 3)                     ;2*3
(- 2 3)                     ;2-3
(/ 2 3)                     ;2/3
(+ 2 3 4)                   ;2+3+4


;;;; expressino evaluation


(< 1 2)                     ;1<2
(> 1 2)                     ;1>2
(equal? 1 2)                ;1==2
(not (equal? 1 2))          ;1!=2


(list el1 el2 el3 etc)      ;list, internallally its a bunch of pairs
(con s 1 2)                   ; pair of 1 and 2
(car p)                     ; get item 1 of pair
(cdr p)                     ;get item 2 of pair