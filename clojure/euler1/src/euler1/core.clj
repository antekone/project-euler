; Project Euler problem #1 in Clojure, by antekone
; http://anadoxin.org/blog
;
; Prerequisites:
; - Leiningen
;
; Usage:
;       $ lein run
; -or-
;       $ lein repl
;       > (euler-1)

(ns euler1.core (:gen-class))

(defn make-sum
  [x y]
  (+ x y))

(defn make-filter
  [x]
  (or
    (= 0
       (mod x 3))
    (= 0
       (mod x 5))))

(defn euler-1
  []
  (reduce make-sum (filter make-filter (range 0 1000))))

; alternative, shorter version:

(defn s1
  []
  (reduce (fn [x y] (+ x y)) (filter (fn [x] (or (= 0 (mod x 3)) (= 0 (mod x 5)))) (range 0 1000))))

; reload function, used from REPL
(defn -r [] (use 'euler1.core :reload))

; main
(defn -main [& args] (println (s1)))
