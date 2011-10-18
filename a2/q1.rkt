#lang racket


;; in this course it seems safe to make assumptions, but in this case
;; I thought it would be best to make sure given 2 numbers, the interval
;; would be better bounded. Should I be doing this or should I just assume they're good?
(define (make-interval a b)
  (if (< a b)
      (cons a b)
      (cons b a)))


(define (lower interval)
  (car interval))

(define (upper interval)
  (cdr interval))


(define (add-interval interval-a interval-b)
  (make-interval (+ (lower interval-a) (lower interval-b)) (+ (upper interval-a) (upper interval-b))))

;; test the addition a bit
(add-interval (make-interval 0 5) (make-interval 1 5)) ; expect (1 . 10)

(define (subtract-interval i1 i2)
  (make-interval (- (lower i1) (upper i2)) (- (upper i1) (lower i2))))

;; test the subtraction
(subtract-interval (make-interval 5 10) (make-interval 5 10))


(define (multiply-interval i1 i2)
  (define (ac)
    (* (lower i1) (lower i2)))
  (define (ad)
    (* (lower i1) (upper i2)))
  (define (bc)
    (* (upper i1) (lower i2)))
  (define (bd)
    (* (upper i1) (upper i2)))
  (make-interval (min (ac) (ad) (bc) (bd)) (max (ac) (ad) (bc) (bd))))

(multiply-interval (make-interval 2 4) (make-interval 3 6))
        