--
-- Project Euler problem #3 by antekone
-- http://anadoxin.org/blog
--
-- Usage:
--
-- $ ghc 4
-- $ ./4
--

-- Warning: very bad code, beware of dragons!

decomp :: Int -> [Int]
decomp x = reverse $ decompInner [] x

decompInner :: [Int] -> Int -> [Int]
decompInner a 0 = a
decompInner a x = a ++ [x `mod` 10] ++ decompInner a (x `div` 10)

buildp :: Int -> [Int]
buildp x = r ++ (reverse r)
	where
		r = decomp x

encomp :: [Int] -> Int
encomp a = (encompInner (reverse a) 10) `div` 10

encompInner :: [Int] -> Int -> Int
encompInner (x:xs) d = x * d + encompInner xs (d * 10)
encompInner [] _ = 0

buildpnum :: Int -> Int
buildpnum x = encomp $ buildp x

buildplist :: [Int] -> [Int]
buildplist a = map buildpnum a

searchp :: [Int] -> [[Int]]
searchp a = map fermat (reverse (buildplist a))

searchm :: [[Int]]
searchm = filter (\ factors -> length (decomp (factors !! 0)) == 3 && length (decomp (factors !! 1)) == 3) $ searchp [100..999]

-- Integer square root, ceiling the partial result.
isqrtc :: Int -> Int
isqrtc x = ceiling $ sqrt $ fromIntegral x

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

{-
main = putStrLn $ show $ (show (m !! 0 !! 0)) ++ " x " ++ (show (m !! 0 !! 1))
	where
		m = searchm;
--}

main = putStrLn $ show $ (show (m !! 0 !! 0)) ++ " x "
	where
		m = searchm;
