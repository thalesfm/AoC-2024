#lang racket

(require "input.rkt" "part-1.rkt")

(define (report-safe?/dampener report)
  (define (dampen report)
    (in-combinations report (sub1 (length report))))
  (for/or ([report (sequence-append (in-value report) (dampen report))])
    (report-safe? report)))

(module+ main
  (define result (count report-safe?/dampener (read-input)))
  (printf "Result: ~a~n" result))