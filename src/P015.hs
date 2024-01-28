module P015 (solve) where

-- get the binomial coefficient from the n-th row and the k-th column of the pascal's triangle
-- the triangle is 0-indexed
binomialc :: Integer -> Integer -> Integer
binomialc n k = div (fact n) (fact (n - k) * fact k)

-- factorial function
fact :: Integer -> Integer
fact = inner 1
  where
    inner acc n
      | n <= 1 = acc
      | otherwise = inner (acc * n) (n - 1)

-- the lattice path is given by the 2n-th row and n-th column of the pascal triangle
latticePaths :: Integer -> Integer
latticePaths n = binomialc (2 * n) n

solve :: IO ()
solve = do
  print $ latticePaths 20
