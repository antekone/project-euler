; Project Euler #2 in Clojure, by antekone
; http://anadoxin.org/blog
;
; Prerequisites:
;
; Leiningen.
;
; Usage:
;
; $ lein run

(ns euler2.core
  (:gen-class))

; Tail-recursive Fibonacci generator
(defn fib-gen [p2 p1 r i n]
  "Generator for fib"
  (if (= i n)
    (+ p1 p2)
    (recur p1 r (+ p1 r) (+ 1 i) n)))

; Interface to the generator.
(defn fib [n]
  "Returns the n-th Fibonacci number using a tail-recursive generator."
  (if (< n 2)
    1N
    (fib-gen 1N 1N 1N 1N n)))

; Returns the sequence of Fibonacci numbers lesser than 4 million.
(defn get-sequence []
  (take-while #(< % 4000000) (map fib (iterate inc 0))))

; Returns the sum of Fibonacci numbers lesser than 4 million (the goal of the
; problem).
(defn problem-2 []
  (reduce + (filter even? (get-sequence))))

; Aux functions, for REPL usage, and -main function, which is an entrypoint of
; the program.
(defn -r [] (use 'euler2.core :reload))
(defn -main
  [& args]
  (println (problem-2)))

