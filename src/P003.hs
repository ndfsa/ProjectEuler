module P003 (solve) where

import Utils (isPrime)

-- get the largest prime factor or a number
largestPrimeFactor :: Integer -> Integer
largestPrimeFactor n = inner n 2
  where
    inner num k
      -- if the number is already a prime, it's largest factor is itself
      | isPrime num = num
      -- if it is a factor and a prime one at that, divide the number and try again, it could be a
      -- repeated factor
      | mod num k == 0 && isPrime k = inner (div num k) k
      -- if not, check the next number
      | otherwise = inner num (k + 1)

solve :: () -> Integer
solve = do
  return (largestPrimeFactor 600851475143)
