#lang racket

(require "input.rkt")

(define (list-distance list-l list-r)
  (for/sum ([x (in-list (sort list-l <))]
            [y (in-list (sort list-r <))])
    (abs (- x y))))

(module+ main
  (define result (call-with-values read-input list-distance))
  (printf "Result: ~a~n" result))