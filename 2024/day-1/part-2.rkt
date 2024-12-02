#lang racket

(require "input.rkt")

(define (similarity-score list-l list-r)
  (define (match-count x)
    (count (lambda (y) (= x y)) list-r))
  (for/sum ([x (in-list list-l)])
    (* x (match-count x))))

(module+ main
  (define result (call-with-values read-input similarity-score))
  (printf "Result: ~a~n" result))