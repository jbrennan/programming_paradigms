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
  (define (interleave-helper r1 r2 result)
    
    (cond ((and (null? r1) (null? r2)) result)
          ((null? r1) (append result r2));(cons (car r2) (reverse (interleave-helper r1 (cdr r2) result))))
          ((null? r2) (append result r1));(cons (car r1) (reverse (interleave-helper (cdr r1) r2 result))))
          (else (interleave-helper (cdr r1) (cdr r2) (append result (list (car r1) (car r2)))))))
    
    
   ; (if (null? r1)
        ; return what's left of r2 appended to result?
    ;    (cons (car r2) (reverse (interleave-helper r1 (cdr r2) result)))
        ; else if r2 is empty, do the same but for r1 instead
     ;   (if (null? r2)
      ;      (cons (car r1) (reverse (interleave-helper (cdr r1) r2 result)))
            ; else neither were empty, so just interleave them
       ;     (interleave-helper (cdr r1) (cdr r2) (cons (cons (car r1) (car r2)) result)))))
  
  (interleave-helper l1 l2 '()))

(interleave '(a b c) '(d e f g h))
            
        
        
