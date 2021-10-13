#lang racket
(require racket/trace)



(define (parse filepath)
  (define in(string->list(port->string(open-input-file filepath))))
  (scanner '() in "" 1)
)

(define (scanner lst str tempstr count)
  (cond
    [(empty? str) 0]
    [(char-whitespace? (first str)) (scanner (cons lst tempstr) (rest str) "" count)]
    
    ;;[(equal? (first str) '#\( ) (scanner  lst (rest str) tempstr count)]
    [(eqv? #\r (first str)) (scanner lst (rest str) tempstr (+ count 1))]
    [else (scanner lst (rest str) (string-append tempstr (first str))  count)]
  )
  (display lst))
    


  
            
     


