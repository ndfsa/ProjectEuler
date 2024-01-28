module P007 (solve) where

import PrimeNumbers (primes)

solve :: IO ()
solve = do
  -- get the 10_001th prime at position 10_000
  print $ primes !! (10_001 - 1)
