#lang racket
;;;;;;;;;;;
;; Values

; #t

; #f

;;;;;;;;;;;;;;
;; Expressions
; 1 < 2 -> #t
; (< 1 2)


; 1 > 2 -> #f
; (> 1 2 )


;;;;;;;;;;;;;;
;; Logical connectives

; (equal? 1 2)

; (equal? 2 2)

; (not (equal? 1 2))


; (and (equal? 2 2) #t)

; (and #t #t)  ; #t
; (and #t #f)  ; #f
; (and #f #t)  ; #f
; (and #f #f)  ; #f

; (or #t #t)  ; #t
; (or #t #f)  ; #t
; (or #f #t)  ; #t
; (or #f #f)  ; #f

; Or example
; (or 1 2 3)
; (or #f 2 3)
; (or #f #f 3)
; (or #f #f #f)

; ; (or) 0 arguments?
; ; (and)

; ; Here or does not evaluate anthing past 1,
; (or 1 2 3 (error "Abort!!!"))
; (or #t (error "2") (error "3") (error "4"))

; What is the equivalent of this behavior, with (and)?

; ----------------------------------------------------

(cond [(> 10 3) (+ 10 100)]
      [(error "not evaled") (error "10 > 1")]
      [else 300])

(cond [#f (error "also does not eval here")]
      [(> 10 1) 200]
      [else 300])


(cond [#f 100]
      [(< 10 1) 200]
      [else 300])



































;