#lang racket

(require "input.rkt")

(define (find-instructions str)
  (regexp-match* #px"mul\\(\\d{1,3},\\d{1,3}\\)" str))

(define (exec-instruction str)
  (match-define (list _ x y)
    (regexp-match #px"mul\\((\\d{1,3}),(\\d{1,3})\\)" str))
  (* (string->number x) (string->number y)))

(module+ main
  (define input (read-input))
  (define result
    (for/sum ([instr (find-instructions input)])
      (exec-instruction instr)))
  (printf "Result: ~a~n" result))