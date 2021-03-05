#lang racket
(require math)

(provide
  (struct-out sample)
  sample->jsexpr
  sample->string
  benchmark)

(define (stats-norm-ppf value)
  (define d (normal-dist))
  (inv-cdf d value))

(define (stats-t-ppf value)
  (error "undefined"))
  ;(define d (student-dist))
  ;(inv-cdf d value))

; Computes the critical value given a NumPy array of samples
; and a confidence coeficient (defaults to 0.95).
(define (critical-value sample-size [confidence-coeficient 0.95] [large-sample 30])
    (define alpha (- 1.0 confidence-coeficient))
    (cond
      ; Z_{1 - alpha/2}
      [(>= sample-size large-sample) (stats-norm-ppf (- 1 (/ alpha 2)))]
      [else
        ; t_{1 - alpha/2}
        (define df (- sample-size 1))
        (stats-t-ppf (- 1 (/ alpha 2)) df)]))


(define (margin-error sample-size sample-std confidence-coeficient)
    (define cval (critical-value sample-size confidence-coeficient))
    (* cval (/ sample-std (sqrt sample-size))))

(define (mean l)
  (define total (foldl + 0.0 l))
  (define count (length l))
  (/ total count))

(struct sample (values stddev margin-error arith-mean) #:transparent)

(define (sample->jsexpr s)
  (hash
    'samples (sample-values s)
    'stdev (sample-stddev s)
    'margin-error (sample-margin-error s)
    'arith-mean (sample-arith-mean s)))

(define (list->sample l [confidence-coeficient 0.95])
  (define std (stddev l))
  (define size (length l))
  (define merr (margin-error size std confidence-coeficient))
  (define l-mean (mean l))
  (sample l std merr l-mean))

;; Times the execution of a thunk
(define (time-thunk thunk)
  (collect-garbage)
  (define start (current-inexact-milliseconds))
  (thunk)
  (- (current-inexact-milliseconds) start))

;; startup-benchmark
(define (benchmark thunk [count 30] [confidence-coeficient 0.95])
  (when (< count 30) (error "Cannot run with fewer than 30 samples."))
  (thunk) ; Discard the first execution
  ; Time the execution of thunk
  (define samples (map (lambda (x) (time-thunk thunk)) (range count)))
  ; Convert the list to a sample object, whilst removing the first sample
  (list->sample samples confidence-coeficient))

(define (sample->string s [precision 2])
  (define (as-str x) (~r x #:precision precision))
  (format
    "~a±~a"
    (as-str (sample-arith-mean s))
    (as-str (sample-margin-error s))))

;(require json)

;(display (jsexpr->string (sample->jsexpr (list->sample (build-list 90 (lambda (x) (random 100)))))))
;(newline)
