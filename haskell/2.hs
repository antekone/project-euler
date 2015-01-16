--
-- Project Euler problem #2 by antekone
-- http://anadoxin.org/blog
--
-- Usage:
--
-- $ ghci
-- Prelude> :l 2
-- *Main> result

fib = 0 : 1 : [ a + b | (a, b) <- zip fib (tail fib) ]

result = foldl1 (+) $ map (\ x -> if x `mod` 2 == 0 then x else 0) $ takeWhile (< 4000000) (tail fib)
