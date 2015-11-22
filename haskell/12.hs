-- Stateful triangle number generator
nextTriangleNumberInit :: [Int]
nextTriangleNumberInit = [0,0]
nextTriangleNumber :: [Int] -> [Int]
nextTriangleNumber [0,0] = [1,1]
nextTriangleNumber [prevValue, index] = [prevValue + (1 + index), 1 + index]
triangleNumberFrom :: [Int] -> Int
triangleNumberFrom [prevValue, index] = prevValue

-- Square root calculator
isqrtc :: Int -> Int
isqrtc x = ceiling $ sqrt $ fromIntegral x

-- Counts number of divisors
divisors2 x = 2 * (length $ filter (\ q -> x `mod` q == 0) [1..isqrtc(x)])

-- Generates the triangle number array and calculates divisor count of every
-- item from this array
generateResults = map (\ x -> [x,divisors2 x]) $ map triangleNumberFrom $ (iterate (\x -> nextTriangleNumber x) nextTriangleNumberInit)

-- Searches for first number that has more than 500 divisors.
generateResult = (take 1 $ filter (\ [a,b] -> b > 500) generateResults) !! 0 !! 0

main = do
    putStrLn("Please wait, calculating...")
    print generateResult
