#lang racket

(provide read-input)

(define (read-input [in (current-input-port)])
  (port->string in))