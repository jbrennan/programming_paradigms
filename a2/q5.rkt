#lang racket

;; Question 5

(define (make-graph)
  (let ([graph (cons '() '())])
    
    
    ;; helpers
    (define (get-v) (car graph))
    (define (get-e) (cdr graph))
    (define (set-v new-v)
      (set! graph (cons new-v (cdr graph))))
    
    (define (set-e new-e)
      (set! graph (cons (car graph) new-e)))
    
    ; adding/removing a node to/from the graph
    (define (add-v v)
      (set-v (append (get-v) (list v))))
    
    (define (del-v v)
      (set-v (remq v (get-v))))
    
    ; add/del an edge from storage
    (define (add-e e)
      (set-e (append (get-e) (list e))))
    
    (define (del-e e)
      (set-e (remq e (get-e))))
    
    (define (contains-node node)
      (if (equal? #f (member node (get-v)))
          #f ; not a member
          #t))
    
    ;;;;;;;; Main functions
    ;; assuming this node doesn't already exist in the graph..
    (define (add-node n)
      (add-v n))
  
    (define (add-edge edge)
      (if (and (contains-node (car edge)) (contains-node (cdr edge)))
          (add-e edge)
          (print "can't add edge -- at least one node doesn't exist in the graph")))
  
    (define (delete-node n)
      (newline))
  
    (define (delete-edge e)
      (del-e e))
  
  
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

(define (make-node symbol)
  symbol)

(define (make-edge n1 n2)
  (cons n1 n2))



(define g (make-graph))
(define n1 (make-node 'node1))
(define n2 (make-node 'node2))
(define n3 (make-node 'node3))

(define e1 (make-edge n1 n2))
(define badE (make-edge n3 'baaaaaad))


;; test some of the graph features
((g 'add-node) n1)
((g 'add-node) n2)
((g 'add-node) n3)

((g 'add-edge) e1)
((g 'add-edge) badE)
