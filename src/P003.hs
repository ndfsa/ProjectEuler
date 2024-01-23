{-# LANGUAGE NumericUnderscores #-}

module P003 (solve) where

import GHC.Float (sqrtFloat)
import Utils (primes)

solve :: () -> Integer
solve = do
  -- input
  let num = 600_851_475_143

  -- calculate search limit
  let limit = round . sqrtFloat . fromIntegral $ num

  -- limit primes to the square root of num
  let possibleFactors = takeWhile (< limit) primes

  -- get actual factors of num
  let factors = filter (\x -> mod num x == 0) possibleFactors

  return (last factors)
