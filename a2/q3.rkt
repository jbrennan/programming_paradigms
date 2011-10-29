#lang racket


;;; Question 3: special consing!


;; provided
(define (special-cons x y)
  (lambda (m) (m x y)))


(define (special-car special-pair)
  (special-pair (lambda (p1 p2) p1)))

(define (special-cdr special-pair)
  (special-pair (lambda (p1 p2) p2)))
(write "special-car and special-cdr.. expecting 'x and 'y respectively")
(newline)
(special-car (special-cons 'x 'y))
(special-cdr (special-cons 'x 'y))

; part b
(define (new-cons x y)
  (lambda (flag) (if (eq? #t flag)
                     x
                     y)))

(define (new-car new-pair)
  (new-pair #t))

(define (new-cdr new-pair)
  (new-pair #f))

(write "custom car and cdr.. expecting 'a and 'b respectively")
(newline)
(new-car (new-cons 'a 'b))
(new-cdr (new-cons 'a 'b))


; part c (triples)
(define (triple x y z)
  (lambda (choice) (cond ((eq? 'x choice) x)
                         ((eq? 'y choice) y)
                         (else z))))

(define (first trpl)
  (trpl 'x))

(define (second trpl)
  (trpl 'y))

(define (third trpl)
  (trpl 'z))

; test them
(write "triple...first, second, third,.. expecting 'd, 'e, 'f respectively")
(newline)
(first (triple 'd 'e 'f))
(second (triple 'd 'e 'f))
(third (triple 'd 'e 'f))