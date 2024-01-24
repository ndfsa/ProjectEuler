module P007 (solve) where

import Utils (primes)

solve :: () -> Integer
solve = do
  return (primes !! (10_001 - 1))
