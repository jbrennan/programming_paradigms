#lang racket

;; Question 5


; This function returns the dispatch procedure which waits for further instruction
; This instruction is in the form of a symbol argument, one of:
; 'add-node, 'add-edge, 'delete-node, 'delete-edge, 'print-graph
;
; Those procedures, dispatched to the caller, mostly take additional arguments (aside from print-graph)
; -node and -edge procs all need 1 argument
; Nodes and Edges are to be contructed by external procedures provided below.
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
    
    (define (remove-edges node)
      (set-e (filter (lambda (ele-e)
                       (if (or (eq? node (car ele-e)) (eq? node (cdr ele-e)))
                           #f
                           #t))
                     (get-e))))
    
    ;;;;;;;; Main functions
    ;; assuming this node doesn't already exist in the graph..
    (define (add-node n)
      (add-v n))
  
    (define (add-edge edge)
      (if (and (contains-node (car edge)) (contains-node (cdr edge)))
          (add-e edge)
          (print "can't add edge -- at least one node doesn't exist in the graph")))
  
    (define (delete-node n)
      (remove-edges n)
      (del-v n))
  
    (define (delete-edge e)
      (del-e e))
  
  
    (define (print-graph-debug)
      graph)
    
    (define (print-graph)
      (map (lambda (node)
             (append (list node "is adjacent to:") (map (lambda (edg) ;; returns the ADJACENT node from the given edge (which is already filtered so we know the edge contains the given node as either car or cdr)
                    (if (eq? (car edg) node)
                             (cdr edg)
                             (car edg)))
                    (filter (lambda (edge) ;; filters ALL edges down to only those containing the given "node"
                       (or (eq? node (car edge)) (eq? node (cdr edge))))      
              (get-e)))))
           (get-v)))
  
    (define (dispatch m)
      (cond ((eq? m 'add-node) add-node)
            ((eq? m 'add-edge) add-edge)
            ((eq? m 'delete-node) delete-node)
            ((eq? m 'delete-edge) delete-edge)
            ((eq? m 'print-graph) print-graph)
            ((eq? m 'debug) print-graph-debug)
            (else (error "Unknown message! -- make-graph\n" m) (newline))))
  
    dispatch))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Node and Edge making procedures
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (make-node symbol)
  symbol)

(define (make-edge n1 n2)
  (cons n1 n2))



(define g (make-graph))
(define n1 (make-node 'node1))
(define n2 (make-node 'node2))
(define n3 (make-node 'node3))
(define n4 (make-node 'node4))

(define e1 (make-edge n1 n2))
(define e2 (make-edge n1 n4))
(define badE (make-edge n3 'baaaaaad))


;; test some of the graph features
(write "Adding 4 nodes and 3 edges. the last edge is invalid. Then printing the graph (and a debug version which shows the internal structure of my graph object)")
(newline)
((g 'add-node) n1)
((g 'add-node) n2)
((g 'add-node) n3)
((g 'add-node) n4)

((g 'add-edge) e1)
((g 'add-edge) e2)
((g 'add-edge) badE)
(newline)
(write "printing the internal structure of the graph... just to see it")
(newline)
((g 'debug))

(write "printing the adjacency list!!")
(newline)
((g 'print-graph))

(write "deleting n2, then printing the graph again")
(newline)
((g 'delete-node) n2)
((g 'print-graph))
