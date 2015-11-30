-- Project Euler problem#14 in Haskell
-- written by antekone
--
-- http://anadoxin.org/blog

collatz :: Int -> Int
collatz 1 = 1
collatz x
    | even x      = x `div` 2
    | otherwise   = 3 * x + 1

collatzChain x = takeWhile (\ x -> x /= 1) (iterate collatz x)
main = do
    print ((maximum $ map (\ x -> [length x, head x, 0]) $ map (\ x -> x : collatzChain x) [1..999999]) !! 1)
