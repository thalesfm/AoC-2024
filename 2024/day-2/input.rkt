#lang racket

(provide read-input)

(define (read-input [in (current-input-port)])
  (for/list ([line (in-list (port->lines in))])
    (map string->number (string-split line))))