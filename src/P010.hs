module P010 (solve) where

import Utils (primes)

solve :: () -> Integer
solve = do
  let dataset = takeWhile (< 2_000_000) primes
  return . sum $ dataset
