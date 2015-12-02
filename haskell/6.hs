problem6 :: [Int] -> Int
problem6 xs = (foldl1 (+) xs) ^ 2 - foldl1 (\ x y -> x + y * y) xs

main = do
    putStrLn $ show $ problem6 [1..100]
