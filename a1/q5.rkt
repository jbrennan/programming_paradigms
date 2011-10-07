#lang racket
;;;; Question 5

; This function multiplies the two term arguments by recursively adding t1 to itself t2 times.

(define (multiply t1 t2)
  (define (mul-iter sum counter)
    (if (>= counter t2)
        sum
        (mul-iter (+ sum t1) (+ 1 counter))))
  (mul-iter 0 0))

(multiply 2 3)

(write "Test case #1 --> Testing (multiply 2 3) ==> expect 6")
(write (multiply 2 3))
(newline)
(write "Test case #2 --> Testing (multiply 0 4) ==> expect 0")
(write (multiply 0 4))
(newline)