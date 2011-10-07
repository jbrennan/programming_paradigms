#lang racket
;;;; Question 8

; Uses Newton's approximation method to approximate the cube-root of argument x
; x is supposed to be a number (we only care about positive numbers)
; This function determines the approximation with the use of some internal functions, and works recursively.

(define (cubert x)
  
  (define (good-enough? guess x)
    (< (abs (- (cube guess) x)) 0.001))
  
  (define (average x y)
    (/ (+ x y) 2))
  
  (define (cube x)
    (* x x x))
  
  (define (improve guess x)
    (/ (+ (/ x (expt guess 2)) (* 2 guess)) 3))
    ;(average guess ( / x guess)))
  
  (define (cubert-iteration guess x)
    (if (good-enough? guess x)
        guess
        (cubert-iteration (improve guess x) x)))
  
  
  (cubert-iteration 1.0 x)) 

(cubert 27)


(write "Test case #1 --> Testing (cubert 27) ==> expect ~3:")
(write (cubert 27))
(newline)
(write "Test case #2 --> Testing (cubert 64) ==> expect ~4:")
(write (cubert 64))
(newline)