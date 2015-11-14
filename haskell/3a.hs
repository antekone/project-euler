testn :: Int
testn = 13195

prodn :: Int
prodn = 600851475143

isqrtc :: Int -> Int
isqrtc x = ceiling $ sqrt $ fromIntegral x

isprime :: Int -> Bool
isprime x = length factors == 2 && minimum factors == 1 && maximum factors == x
	where factors = fermat x

searchm :: [Int] -> Int -> Int
searchm [] m = m
searchm (x:xs) m
	| isprime x = maximum [x, m, searchm xs m]
	| otherwise = maximum [searchm (fermat x) m, searchm xs m]

fermat :: Int -> [Int]
fermat 0 = []
fermat modulus
    -- Skip even moduli.
    | modulus `mod` 2 == 0 = [modulus `div` 2, 2]
    | otherwise            = fermatGen modulus $ isqrtc modulus

--
-- Fermat factorization:
--
-- You increase `a` by 1 until `a*a-N` = `b*b`.
-- Start with `a=ceil(sqrt(modulus))`.
--
-- When `until` is reached, factors are: [a-b, a+b].
--

fermatGen :: Int -> Int -> [Int]
fermatGen modulus a
    -- End conditional.
    | b * b == a * a - modulus            = [a - b, a + b]
    -- Loop.
    | otherwise                           = fermatGen modulus $ a + 1
    where
        b = isqrtc(a * a - modulus);

main = putStrLn(show $ searchm [prodn] 0)
