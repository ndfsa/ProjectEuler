module P015 (solve) where
import Data.Function (fix)
import Memoization (memoize)

-- get the binomial coefficient from the n-th row and the k-th column of the pascal's triangle
-- the triangle is 0-indexed
binomialc :: Integer -> Integer -> Integer
binomialc n k = div (fact n) (fact (n - k) * fact k)

-- factorial function
mFact :: (Integer -> Integer) -> Integer -> Integer
mFact _ 0 =  1
mFact _ 1 =  1
mFact f n =  n * f (n - 1)

fact :: Integer -> Integer
fact = fix (memoize . mFact)

-- the lattice path is given by the 2n-th row and n-th column of the pascal triangle
latticePaths :: Integer -> Integer
latticePaths n = binomialc (2 * n) n

solve :: IO ()
solve = do
  print $ latticePaths 20
