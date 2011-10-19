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