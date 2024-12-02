#lang racket

(provide read-input)

(define (read-input [in (current-input-port)])
  (define input
    (for/list ([line (in-list (port->lines))])
      (match-define (list l r) (string-split line))
      (cons (string->number l) (string->number r))))
  (values (map car input) (map cdr input)))