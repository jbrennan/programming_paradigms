#lang racket

;; Question 8
; recurses by using map
(define (depth lst)
  (define (atom? x) (not (pair? x)))
  (cond ((atom? lst) 0)
        (else (+ (apply max (map depth lst)) 1))))


(newline)

(write "Test case #1 --> Testing (depth 'a) ==> expect 0")
(write (depth 'a))
(newline)
(write "Test case #2 --> Testing (depth '(((((a(((b)))))))))  ==> expect 8:")
(write (depth '(((((a(((b))))))))))
(newline)


;; extra cases
(depth '(a))
(depth '(a (b) c))


