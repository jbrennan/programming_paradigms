#lang racket

(define (position at lis)
  (define (p-iter lisn count)
    (cond ((eq? lisn '()) 0)
          ((eq? (car lisn) at) (+ 1 count))
          (else (p-iter (cdr lisn) (+ 1 count)))))
  
  (p-iter lis 0))

(position 1 '(2 3 1 4))
(position 'a '(b b c a b a))
(position 'a '(b c))