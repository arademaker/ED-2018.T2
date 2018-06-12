#lang racket

;; naive version
(define (fib-naive n)
  (match n
    [0 0]
    [1 1]
    [_ (+ (fib-naive (sub1 n)) (fib-naive (- n 2)))]))

;; iteractive
(define (fib-iter n)
  (let ([a 0]
        [b 1])
    (for ([i (in-range n)])
      (set!-values (a b) (values b (+ a b))))
    a))

;;; accumulators
;; all definitions in this section are equivalent, the first uses a
;; named-let form instead of a define, and the last one uses default
;; arguments

(define (fib-acc-named n)
  (let go ((cnt 0) (a 0) (b 1))
    (if (= n cnt)
        a
        (go (+ cnt 1) b (+ a b)))))

(define (fib-acc n)
  (define (go n a b)
    (if (= n 0)
        a
        (go (sub1 n) b (+ a b))))
  (go n 0 1))

(define (fib-acc-if n (a 0) (b 1))
  (if (< n 2)
      1
      (+ a (fib-acc-if (- n 1) b (+ a b)))))

;; infinite list
(require racket/stream)

(define (fibs-stream)
  (define (next fs)
    (let ([a (stream-ref fs 0)]
          [b (stream-ref fs 1)]
          [fst (stream-rest fs)])
      (stream-cons (+ a b) (next fst))))
  (stream* 0 1 (next (fibs-stream))))


;; generator
(require racket/generator)

(define (repeater f n)
  (for/last ((i (in-range n)))
    (f)))

(define fibs-gen
  (let ([a 0]
        [b 1])
    (infinite-generator
     (yield b)
     (set!-values (a b) (values b (+ a b))))))
