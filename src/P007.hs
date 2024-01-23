{-# LANGUAGE NumericUnderscores #-}
module P007 (solve) where

import Utils (isPrime)

-- function returns the nth prime number
nthPrime :: Integer -> Integer
nthPrime n = inner n 2
  where
    inner k acc
      | k <= 1 && isPrime acc = acc
      | isPrime acc = inner (k - 1) (acc + 1)
      | otherwise = inner k (acc + 1)

solve :: () -> Integer
solve = do
  return (nthPrime 10_001)
