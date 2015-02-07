; Project Euler #7 in Clojure by antekone
; http://anadoxin.org/blog
;
; Usage:
;
; $ lein run

(ns euler7.core (:gen-class)
  (:require [clojure.math.numeric-tower :as math]))

; Tail-recursive Sieve of Eratosthenes implementation.
; (not really optimized)

; Main sieve logic.
;
; It expects 3 arguments:
;
; i - sieve step,
; j - current sieve index,
; A - sieve state vector.
;
; Each call to this function can change the sieve vector A. Return value is a
; new vector A, which can be changed, or not.
(defn e-sieve-A [i j A]
  ; Check if we're in the allowed bounds.
  (if (> j (count A))
    ; We're out of bounds: this means sieving is done. Return the state vector A
    ; unchanged.
    A

    ; We're in the bounds.
    ;
    ; Define the value 'nj', which will be the sum of i and j.
    ; Define the value 'nA', which will be a new vector derived from A, but with
    ; j-th element changed to false.
    (let [nj (+ j i)
          nA (assoc A j false)]
      ; Recursively continue to next iteration.
      (recur i nj nA))))

; Generator for 'e-sieve'.
;
; It expects 3 argument:
;
; i     - current iteration counter,
; sqrtn - iteration finish counter,
; A     - a sieve state. Initial vector can be full of 'true' items.
;
; This generator will sieve all non-primes from the range of (i,sqrtn).
(defn e-sieve-gen [i sqrtn A]
  ; Tail-recursion loop end conditional.
  (if (>= i sqrtn)
    ; If the loop is over, convert the result vector to a better format and return it.
    ; This is the final value of 'e-sieve-gen'.
    (map-indexed (fn [i b] (if (true? b) i 0)) A)

    ; If the loop is not over yet...
    ;
    ; Make sure we won't perform any double operations by checking if this value
    ; was already sieved, or not.
    (if (false? (nth A i))
      ; Value was already sieved, skip it by recursively continuing to the next
      ; iteration, using unchanged sieve state A.
      (recur (+ 1 i) sqrtn A)

      ; If the value was not sieved yet, sieve it.
      ;
      ; Define a number 'j' that will be the start position for this sieving
      ; process.
      (let [j (* i i)]
        ; Recursively continue with another iteration with altered sieve state
        ; A. Altering the sieve state is done by 'e-sieve-A' function.
        (recur (+ 1 i) sqrtn (e-sieve-A i j A))))))

(defn e-sieve [n]
  ; Define a vector A of size n, then set all of its elements to 'true'.
  ; Also, define the 'sqrtn' name that is equal to a square root of 'n'.
  (let [A     (vec (take n (repeat true)))
        sqrtn (math/sqrt n)]

    ; Define 'primes' that will hold the result of 'e-sieve-gen' function.
    (let [primes (e-sieve-gen 2 sqrtn A)]
      ; 'e-sieve-gen' will return a vector in the form of:
      ;
      ; [0 1 2 3 0 5 0 7 0 0 0 11 ...]
      ;
      ; Filter out all zeroes from this vector, so we can have a result in
      ; the form of a simple vector with only prime numbers inside.
      (filter (fn [x] (not= x 0)) primes))))


; ----- take #2, minimalized version ------

(defn min-e-sieve-A [i j A]
  (if (> j (count A)) A (recur i (+ j i) (assoc A j false))))

(defn min-e-sieve-gen [i sqrtn A]
  (if (>= i sqrtn)
    (map-indexed (fn [i b] (if (true? b) i 0)) A)
    (recur (+ 1 i) sqrtn (if (false? (nth A i)) A (min-e-sieve-A i (* i i) A)))))

(defn min-e-sieve [n]
    (filter (fn [x] (not= x 0)) (min-e-sieve-gen 2 (Math/sqrt n) (vec (take n (repeat true))))))

; -----------------------------------------

; Entry-point.

(defn -main
  [& args]
  (let [result (nth (e-sieve 106000) 10001)]
    (println result)))

; Reload function, used from REPL
(defn -r [] (use 'euler7.core :reload))
