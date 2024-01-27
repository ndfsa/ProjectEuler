module P010 (solve) where

import PrimeUtils (primes)

solve :: IO ()
solve = do
  -- just take all primes under 2_000_000
  let dataset = takeWhile (< 2_000_000) primes
  print $ sum dataset
