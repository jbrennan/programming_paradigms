#lang racket


;; Question 6
(define (average a . remaining)
  (if (empty? remaining)
      a
      (/ (apply + (append (list a) remaining)) (+ 1 (length remaining)))))

(average 10 20 30 40)
(average 4)


; part b
(define (increasing? a . remaining)
  (cond ((empty? remaining) #t)
        ((> a (car remaining)) #f)
        (else (apply increasing? (car remaining) (cdr remaining)))))

(increasing? 1 2 7 4)
(increasing? 5 5)