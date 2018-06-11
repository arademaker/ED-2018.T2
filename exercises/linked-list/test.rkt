#lang racket/base

(require "simple-linked-list.rkt")

(module+ test
  (require rackunit rackunit/text-ui))

(module+ test

  (define suite
    (test-suite
     "Simple linked list tests"3

     (test-eqv? "length of empty list"
                (my-length my-null)
                0)

     (test-eqv? "length of singleton list"
                (my-length (my-list 1))
                1)

     (test-eqv? "length of normal list"
                (my-length (my-list 1 3 5 7))
                4)

     (check-exn exn:fail?
                (lambda () (my-first my-null))
                "Error on empty list first.")

     (test-equal? "singleton has first"
                  (my-first (my-list 1))
                  1)

     (test-equal? "non-null list has correct first"
                  (my-first (my-list 1 4 7 9))
                  1)

     (test-equal? "can cons to non-null list"
                  (my-length (my-cons 3 (my-list 1 2 3)))
                  4)

     (test-equal? "consing to null changes first"
                  (my-first (my-list 5))
                  5)

     (test-equal? "rest from singleton is null"
                  (my-rest (my-list 3))
                  my-null)

     (test-equal? "list with no arguments is null"
                  (my-list)
                  my-null)

     (test-equal? "reverse of empty list"
                  (my-reverse my-null)
                  my-null)

     (test-equal? "reverse of singleton list"
                  (my-reverse (my-list 5))
                  (my-list 5))
     
     (test-equal? "reverse of normal list"
                  (my-reverse (my-list 1 3 5 7))
                  (my-list 7 5 3 1))))

  (run-tests suite))
