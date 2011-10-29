#lang racket

(define (depth lst)
  (define (atom? x) (not (pair? x)))
  (cond ((atom? lst) 0)
        (else (+ (apply max (map depth lst)) 1))))

(depth 'a)
(depth '(a))
(depth '(a (b) c))
(depth '(((((a(((b))))))))) 