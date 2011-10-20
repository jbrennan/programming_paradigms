#lang racket


;; Question 6
(define (average a . remaining)
  (if (empty? remaining)
      a
      (/ (apply + (append (list a) remaining)) (+ 1 (length remaining)))))

(average 10 20 30 40)
(average 4)