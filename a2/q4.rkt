#lang racket

;; Part a
(require racket/trace)
(define (subsets x)
  (if (null? x)
      '(())
      (let ((rest (subsets (cdr x))))
        (append rest (map (lambda (sub) (cons (car x) sub)) rest)))))
      
      
(trace subsets)
(subsets '(a b c))


;; part b
(define (filter predicate lst)
;  (if (predicate (car lst))
;      (append (car lst) (filter predicate (cdr lst)))
;      (filter predicate (cdr lst))))
  (define (filter-iter predicate cur-lst result)
    (if (null? cur-lst)
        result
        (if (predicate (car cur-lst))
            (filter-iter predicate (cdr cur-lst) (cons (car cur-lst) result))
            (filter-iter predicate (cdr cur-lst) result))))
        
  
  ; NOTE: if it was required to have the list in the reverse order...
  ; well, you could probably guess I'd just throw a (reverse ..) in front of this call
  ; but since it wasn't specified, I'm not going to bother.
  (filter-iter predicate lst '()))
    
  
(filter odd? '(1 2 3 4 5 6))
      


;; part c
(define (interleave l1 l2)
  
