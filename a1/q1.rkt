#lang racket


;;;; Question 1, expecting output 521 and (1/14) respectively (as calculated on paper)
; These two functions both just perform a pre-programmed mathematical expression, taking no arguments.
(define (q1a)
  (+ (* 9 (+ (* 3 5) (* 6 7))) (* 2 4)))

(define (q1b)
  (+ -1 (/ (* 3 (- (+ 3 (* 4 2)) 6)) (* 7 2))))

(write "Test case #1 --> Testing (q1a) ==> expect 521:")
(write (q1a))
(newline)
(write "Test case #2 --> Testing (q1b) ==> expect (1/14):")
(write (q1b))
(newline)