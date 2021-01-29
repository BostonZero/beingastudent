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
