#lang racket


;; Question 6
(define (average a . remaining)
  (if (empty? remaining)
      a
      (/ (apply + (append (list a) remaining)) (+ 1 (length remaining)))))
(write "average of 10 20 30 40... expecting: 25")
(newline)
(average 10 20 30 40)

(write "average of 4... expecting 4")
(newline)
(average 4)


; part b
(define (increasing? a . remaining)
  (cond ((empty? remaining) #t)
        ((> a (car remaining)) #f)
        (else (apply increasing? (car remaining) (cdr remaining)))))
(write "increasing? of 1 2 7 4... expecting ==> #f")
(newline)
(increasing? 1 2 7 4)
(write "increasing? of 5 5... expecting: #t")
(newline)
(increasing? 5 5)