--
-- Project Euler problem #1 by antekone
-- http://anadoxin.org/blog
--
-- Usage:
--
-- $ ghci
-- Prelude> :l 1
-- *Main> sumList $ generateList $ take 1000 [0..]
--

numbers = take 1000 [0..]

sumList :: [Int] -> Int
sumList (x:xs) = x + sumList xs
sumList [] = 0

div35 :: Int -> [Int]
div35 x
    | x == 0            = []
    | x `mod` 3 == 0    = [x]
    | x `mod` 5 == 0    = [x]
    | otherwise         = []

generateList :: [Int] -> [Int]
generateList (x:xs) = div35 x ++ generateList xs
generateList [] = []

result = sumList $ generateList numbers

result2 = sumList $ filter (\ x -> x `mod` 3 == 0 || x `mod` 5 == 0) [0..999]
