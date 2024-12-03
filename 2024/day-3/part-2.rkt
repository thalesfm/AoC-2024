#lang racket

(require "input.rkt")

(define (find-instructions str)
  (regexp-match* #px"do\\(\\)|don't\\(\\)|mul\\(\\d{1,3},\\d{1,3}\\)" str))

(define enabled #t)

(define (exec-instruction str)
  (cond
   [(string=? str "do()") (set! enabled #t) 0]
   [(string=? str "don't()") (set! enabled #f) 0]
   [(regexp-match #px"mul\\((\\d{1,3}),(\\d{1,3})\\)" str) =>
    (lambda (match)
      (match-define (list _ x y) match)
      (if enabled
          (* (string->number x) (string->number y))
          0))]
    [else (error "Failed to parse" str)]))

(module+ main
  (define input (read-input))
  (define result
    (for/sum ([instr (find-instructions input)])
      (exec-instruction instr)))
  (printf "Result: ~a~n" result))