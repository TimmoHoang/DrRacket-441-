#lang racket

(require racket/trace)



(define (parse filepath)
  (define in(string->list(port->string(open-input-file filepath))))
  (scanner '() in "" 1)
)

(define (scanner lst str tempstr count)
  (cond
    [(empty? (first str)) 0]
    [(char-whitespace? (first str)) (scanner (append lst tempstr) (rest str) "" count)]
    [else (scanner lst (rest str) (string-append tempstr (string (first str))) count)])
  (display tempstr))