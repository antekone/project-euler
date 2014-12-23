--
-- Project Euler problem #3 by antekone
-- http://anadoxin.org/blog
--
-- Usage:
--
-- $ ghc 3
-- $ ./3
--

testn :: Int
testn = 13195

prodn :: Int
prodn = 600851475143

-- Integer square root, ceiling the partial result.
isqrtc :: Int -> Int
isqrtc x = ceiling $ sqrt $ fromIntegral x

-- Search for biggest prime factor for numbers specified in the argument. For
-- example:
--
-- *Main> searchm [testn] 0
-- 29
-- *Main> searchm [testn,prodn] 0
-- 6857
searchm :: [Int] -> Int -> Int
searchm [] m = m
searchm (x:xs) m =
    maximum $ if isprime then [x, m, rec] else [searchm q m, rec]
    where
        -- Let `q` be a list of factors for `x`.
        q = fermat x;

        -- If `q` is in the form of [a,b], where either `a` or `b` is `1` or
        -- `x`, then I consider this `q` as a pair of factors for a prime
        -- number. In this case `isprime` will be True. Otherwise, it will be
        -- False.
        isprime = length q == 2 && minimum q == 1 && maximum q == x;

        -- Continue recursively to the rest of the input list.
        rec = searchm xs m;

-- Fermat factorization gateway function. Real Fermat algorithm is in
-- `fermatGen`.
fermat :: Int -> [Int]
fermat 0 = []
fermat modulus
    -- Skip even moduli.
    | modulus `mod` 2 == 0 = [modulus `div` 2, 2]
    | otherwise            = fermatGen modulus $ isqrtc modulus

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

-- Entry point.
main = putStrLn(show $ searchm [prodn] 0)
