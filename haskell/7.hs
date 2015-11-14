-- upto 2 10 foundprimes=[]

findprimes :: Int -> (Int -> ([Int] -> [Int]))
findprimes curp maxp foundp =
	if curp <= maxp
	then findprimes (1 + curp) maxp $ foundp ++ getprime curp foundp
	else foundp

getprime :: Int -> ([Int] -> [Int])
getprime curp (x:xs) =
	if curp `mod` x == 0
	then []
	else getprime curp xs
getprime curp []     = [curp]
