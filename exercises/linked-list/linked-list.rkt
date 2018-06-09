#lang racket

(provide my-list    ; (my-list 1 2) <-> (my-cons 1 (my-cons 2 my-null))
         my-cons    ; (my-cons 1 (my-list 2 3)) <-> (my-list 1 2 3)
         my-first   ; (my-first (my-list 1 2 3)) -> 1
         my-rest    ; (my-rest (my-list 1 2 3)) <-> (my-list 2 3)
         my-length  ; (my-length (my-list 1 2 3 4)) -> 4
         my-reverse ; (my-reverse (my-list 1 2)) <-> (my-list 2 1)
         my-null)   ; my-null ; is a constant
