#lang racket

; Question 2
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


; part b

(define (create-record-shelf record-collection-list)
  (define (print-shelf)
    record-collection-list)
  
  (define (add-record record)
    (set! record-collection-list (append record-collection-list (list record))))
  
  (define (find-record title)
    (filter (lambda (ele-record) (if (equal? (record-name ele-record) title) 
                                     #t 
                                     #f))
            record-collection-list))
  
  
  (define (delete-record title)
    ; only delete it if its in the list
    (set! record-collection-list (filter (lambda (ele-record)
                                           (if (equal? title (record-name ele-record))
                                               #f
                                               #t))
                                         record-collection-list)))
  (define (discography-of artist)
    (filter (lambda (ele-record) (if (equal? artist (record-artist ele-record)) #t #f)) record-collection-list))
  
  ; dispatch: returned by this procedure.. -dispatch returns a procedure based on its arg
  (define (dispatch message)
    (cond ((eq? message 'add-record) add-record)
          ((eq? message 'find-record) find-record)
          ((eq? message 'delete-record) delete-record)
          ((eq? message 'discography-of) discography-of)
          ((eq? message 'print) print-shelf)
          (else (error "Unknown message -- create-record-shelf" message))))
  
  dispatch) ; return the dispatch. it waits for a message, which in turn returns a proc, which takes an arg itself



;(define (add-record record lst)
;  (append lst (list record))) ; though 'record should already be a list, we want to append it as a list, not its elements

;(define (find-record record lst)
;  (filter lst (lambda (ele-record) (if (eq? (record-name ele-record) (record-name record)) #t #f))))


;; define some records for testing with
(define highway (record-maker '(Highway 61 Revisited) '1965 '(Bob Dylan) 'Columbia))
(define freewheelin (record-maker '(The Freewheelin Bob Dylan) '1963 '(Bob Dylan) 'Columbia))
(define the-times (record-maker '(The Times They Are A-Changin) '1964 '(Bob Dylan) 'Columbia))
(define tago (record-maker '(Tago Mago) '1972 '(Can) '(United Artists)))


;; create the shelf, then add some records
(define shelf (create-record-shelf '()))
((shelf 'add-record) highway)
((shelf 'add-record) freewheelin)
((shelf 'add-record) the-times)
((shelf 'add-record) tago)
((shelf 'add-record) record)
((shelf 'print)) ;; print it out just to see so far..


;; find a record
(newline)
(newline)
((shelf 'find-record) '(Yellow Submarine))
((shelf 'find-record) '(made up name!!!!!!!!!!!))


;; Print out the discography of a given artist
(newline)
((shelf 'discography-of) '(Bob Dylan))


;; remove a given album
(newline)
((shelf 'delete-record) '(Highway 61 Revisited))
((shelf 'print))



