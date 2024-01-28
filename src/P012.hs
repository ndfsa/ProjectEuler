module P012 (solve) where

import Data.List (group)
import PrimeNumbers (pdecompose)

-- get the number of divisors of n
ndiv :: Integer -> Integer
ndiv 1 = 1
ndiv n = product $ map (1 +) $ tail $ map (toInteger . length) $ group $ pdecompose n

-- get the number of divisors of the triangle number n*m/2
-- it is guaranteed that either n or m is even
trndiv :: (Integer, Integer) -> Integer
trndiv (n, m)
  | even n = ndiv (div n 2) * ndiv m
  | even m = ndiv n * ndiv (div m 2)
  | otherwise = 0

solve :: IO ()
solve = do
  -- get the pairs (n, n+1)
  let nn1 = zip [1 :: Integer ..] [2 :: Integer ..]

  -- get the divisors of the triangle number
  let divisors = map (\it@(n, n1) -> (n * n1, trndiv it)) nn1

  print $ (`div` 2) $ fst . head $ dropWhile ((< 500) . snd) divisors
