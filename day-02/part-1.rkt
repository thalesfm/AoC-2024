#lang racket

(provide report-safe?)

(require "input.rkt")

(define (andmap-between proc lst)
  (for/and ([x (in-list lst)]
            [y (in-list (drop lst 1))])
    (proc x y)))

(define (monotonic? lst)
  (define (strictly-increasing? lst) (andmap-between < lst))
  (define (strictly-decreasing? lst) (andmap-between > lst))
  (or (strictly-increasing? lst) (strictly-decreasing? lst)))

(define (report-safe? report)
  (define (safe-difference? x y)
    (<= 1 (abs (- x y)) 3))
  (and (andmap-between safe-difference? report) (monotonic? report)))

(module+ main
  (define result (count report-safe? (read-input)))
  (printf "Result: ~a~n" result))