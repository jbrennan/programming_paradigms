#lang racket

;; Question 5

(define (make-graph)
  (let ([graph '()])
    
    (define (make-edge x y)
      (newline))
  
    (define (make-node n)
      (newline))
  
  
    (define (add-node n)
      (newline))
  
    (define (add-edge n1 n2)
      (newline))
  
    (define (delete-node n)
      (newline))
  
    (define (delete-edge e)
      graph
      (newline)
      (set! graph (append graph '(d e f)))
      graph)
  
  
    (define (print-graph)
      (newline))
  
    (define (dispatch m)
      (cond ((eq? m 'add-node) add-node)
            ((eq? m 'add-edge) add-edge)
            ((eq? m 'delete-node) delete-node)
            ((eq? m 'delete-edge) delete-edge)
            ((eq? m 'print-graph) print-graph)
            (else (error "Unknown message! -- make-graph" m))))
  
    dispatch))

(define g (make-graph))
((g 'delete-edge) 'zz)
((g 'delete-edge) 'zz)