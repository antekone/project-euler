--
-- Project Euler problem #3 by antekone
-- http://anadoxin.org/blog
--
-- Usage:
--
-- $ ghci
-- Prelude> :l 3
-- [1 of 1] Compiling Main             ( 3.hs, interpreted )
-- Ok, modules loaded: Main.
-- *Main> fermat prodn
-- [486847,1234169]
-- *Main> fermat 486847
-- [71,6857]   <- second one of these factors is the answer
-- *Main> fermat 71
-- [1,71]
-- *Main> fermat 6857
-- [1,6857]
-- *Main> fermat 1234169
-- [839,1471]
--

testn :: Int
testn = 13195

prodn :: Int
prodn = 600851475143

isqrtc :: Int -> Int
isqrtc x = ceiling $ sqrt $ fromIntegral x

fermat :: Int -> [Int]
fermat 0 = []
fermat modulus
    -- Skip even moduli.
    | modulus `mod` 2 == 0 = [modulus `div` 2]
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
