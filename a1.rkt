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



;;;; Question 4
;(define (exp base power)
;  (define (exp-iter b p product)



;;;; Question 5
(define (multiply t1 t2)
  (define (mul-iter sum counter)
    (if (>= counter t2)
        sum
        (mul-iter (+ sum t1) (+ 1 counter))))
  (mul-iter 0 0))

(multiply 2 3)



;;;; Question 8
(define (sqrt x)
  
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  
  (define (average x y)
    (/ (+ x y) 2))
  
  (define (square x)
    (* x x))
  
  (define (improve guess x)
    (average guess ( / x guess)))
  
  (define (sqrt-iteration guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iteration (improve guess x) x)))
  
  
  (sqrt-iteration 1.0 x)) 

(sqrt 2)

;;;; Question 9
(define (a-b a b)
  ((cond ((> b 0) +) ((= b 0) -) (else *)) a b))

;; This function will add a and b if b is positive and non-zero
;; This function will subtract b from a if b is zero (which results in a)
;; This function will multiply a and b if b is a negative number
(a-b 2 5) ; returns the result of a + b
(a-b 2 0) ; returns a
(a-b 2 -5) ; returns a * b




;;;; Question 10
(define (sqrt x)
  
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  
  (define (average x y)
    (/ (+ x y) 2))
  
  (define (square x)
    (* x x))
  
  (define (improve guess x)
    (average guess ( / x guess)))
  
  (define (sqrt-iteration guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iteration (improve guess x) x)))
  
  
  (sqrt-iteration 1.0 x)) 

(sqrt 2)
