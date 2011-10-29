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
(newline)

(write "Test case #1 --> Testing (add-interval (make-interval 0 5) (make-interval 1 5)) ==> expect (1 . 10)")
(write (add-interval (make-interval 0 5) (make-interval 1 5))) ; expect (1 . 10))
(newline)



(define (subtract-interval i1 i2)
  (make-interval (- (lower i1) (upper i2)) (- (upper i1) (lower i2))))

;; test the subtraction
(write "Test case #2 --> Testing (subtract-interval (make-interval 5 10) (make-interval 10 10)) ==> expect (-5 . 0)")
(write (subtract-interval (make-interval 5 10) (make-interval 10 10)))
(newline)



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


(write "Test case #3 --> Testing (multiply-interval (make-interval 2 4) (make-interval 3 6)) ==> expect (6 . 24)")
(write (multiply-interval (make-interval 2 4) (make-interval 3 6)))
(newline)



(define (divide-interval i1 i2)
  (define (contains-zero)
    (if (= 0 (lower i2))
        #t
        (if (= 0 (upper i2))
            #t
            #f)))
  (if (contains-zero)
      (error "divide-interval -- the second interval contained a 0. illegal")
      (multiply-interval i1 (make-interval (/ 1 (upper i2)) (/ 1 (lower i2))))))

(write "Test case #4 --> Testing (divide-interval (make-interval 2 4) (make-interval 4 8)) ==> expect (1/4 . 1)")
(write (divide-interval (make-interval 2 4) (make-interval 4 8)))
(newline)

(write "finally, this one contains a 0 in the second argument interval which results in an error!!")
(divide-interval (make-interval 2 4) (make-interval 0 8))