#lang racket


;; Question 7

(define (combinations n lst)
  (cond ((= 0 n) '(()))
        ((null? lst) '())
        (else (append (map (lambda (item)
                             (cons (car lst) item))
                           (combinations (- n 1) (cdr lst)))
                      (combinations n (cdr lst))))))

(write "Test case #1 --> Testing (combinations 2 '(joe jane jim sue)) ==> expect '((joe jane) (joe jim) (joe sue) (jane jim) (jane sue) (jim sue))")
(write (combinations 2 '(joe jane jim sue)))
(newline)
(write "Test case #2 --> Testing (combinations 3 '(a b c d e))   ==> expect '((a b c) (a b d) (a b e) (a c d) (a c e) (a d e) (b c d) (b c e) (b d e) (c d e)):")
(write (combinations 3 '(a b c d e)) )
(newline)



