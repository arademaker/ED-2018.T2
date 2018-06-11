#lang racket

(provide my-list
         my-cons
         my-first
         my-rest
         my-length
         my-reverse
         my-null)

(struct my-cons (elm lst)
  #:guard (lambda (elm lst _name)
            (unless (or (my-cons? lst) (my-null? lst))
              (error "Second argument must be a list."))
            (values elm lst))
  #:reflection-name 'cons
  #:transparent)

(struct nada ()
  #:reflection-name 'null)

(define (my-null? lst)
  (nada? lst))

(define my-null
  (nada))

(define (my-first lst)
  (my-cons-elm lst))

(define (my-rest lst)
  (my-cons-lst lst))

(define (my-length lst)
  (define (go l acc)
    (if (my-null? l)
        acc
        (go (my-rest l) (add1 acc))))
  (go lst 0))

(define (my-reverse lst)
  (define (go l rl)
    (if (my-null? l)
        rl
        (go (my-rest l) (my-cons (my-first l) rl))))
  (go lst my-null))

(define my-list
  (case-lambda
    [() my-null]
    [(fst . rst) (my-cons fst (apply my-list rst))]))
