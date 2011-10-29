#lang racket


;; Question 7

(define (combinations n lst)
  (cond ((= 0 n) '(()))
        ((null? lst) '())
        (else (append (map (lambda (item)
                             (cons (car lst) item))
                           (combinations (- n 1) (cdr lst)))
                      (combinations n (cdr lst))))))


(combinations 2 '(joe jane jim sue))
(combinations 3 '(a b c d e)) 
(combinations 0 '(1 2 3))