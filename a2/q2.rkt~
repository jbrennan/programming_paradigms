#lang racket

; Question 3
; (((Yellow Submarine) 1968 (The Beatles) Apple))

(define (record-maker name year artist label)
  (list name year artist label))

(define (record-name record)
  (car record))

(define (record-year record)
  (car (cdr record)))

(define (record-artist record)
  (car (cdr (cdr record))))

(define (record-label record)
  (car (cdr (cdr (cdr record)))))

(define record (record-maker '(Yellow Submarine) '1968 '(The Beatles) 'Apple))
(record-name record)
(record-year record)
(record-artist record)
(record-label record)