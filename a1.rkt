#lang racket

;;;; Question 1, expecting output 521 and (1/14) respectively (as calculated on paper)
(+ (* 9 (+ (* 3 5) (* 6 7))) (* 2 4))

(+ -1 (/ (* 3 (- (+ 3 (* 4 2)) 6)) (* 7 2)))

;;;; Question 2
(define (f n)
  (if (< n 4)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))) (* 4 (f (- n 4))))))

(f 5)

;(define (f2 n)
 ; (define (f-iter n sum factor)
  ;  (if (< n 4)
   ;     n
    ;    (
    


;;;; Question 3
(define (pascal row)
  
  ;; get a given element of the triangle
  (define (p-row-col r c)
    (cond ((= 0 r) 1)
          ((= 1 r) 1)
          ((= 0 c) 1)
          ((= c r) 1)
          (else (+ (p-row-col (- r 1) (- c 1)) (p-row-col (- r 1) c)))))
  
  ;; print all the columns in the given row
  (define (print-row-iter r counter)
    (if (> counter r)
        (newline)
        (begin (display (p-row-col r counter))
                     (print-row-iter r (+ counter 1)))))
  (print-row-iter row 0))

(pascal 5)