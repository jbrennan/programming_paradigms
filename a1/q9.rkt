#lang racket
;;;; Question 9
(define (a-b a b)
  ((cond ((> b 0) +) ((= b 0) -) (else *)) a b))

;; This function will add a and b if b is positive and non-zero
;; This function will subtract b from a if b is zero (which results in a)
;; This function will multiply a and b if b is a negative number
(a-b 2 5) ; returns the result of a + b
(a-b 2 0) ; returns a
(a-b 2 -5) ; returns a * b

(write "Test case #1 --> Testing (a-b 2 5) ==> expect 7")
(write (a-b 2 5))
(newline)
(write "Test case #2 --> Testing (a-b 2 0) ==> expect 2")
(write (a-b 2 0))
(newline)
(write "Test case #3 --> Testing (a-b 2 -5) ==> expect -10:")
(write (a-b 2 -5))
(newline)