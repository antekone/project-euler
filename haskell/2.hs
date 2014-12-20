--
-- Project Euler problem #2 by antekone
-- http://anadoxin.org/blog
--
-- Usage:
--
-- $ ghci
-- Prelude> :l 2
-- *Main> sumEven fibUnder4Million
--

sumEven :: [Int] -> Int
sumEven (x:xs)
    | x `mod` 2 == 0    = x + sumEven xs
    | otherwise         = sumEven xs
sumEven [] = 0

fib :: [Int]
fib = 0 : 1 : [ a + b | (a, b) <- zip fib (tail fib) ]

fibUnder4Million :: [Int]
fibUnder4Million = takeWhile(< 4000000) $ tail fib
