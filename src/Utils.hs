module Utils (isPrime) where

import GHC.Float.RealFracMethods (roundDoubleInteger)

-- checks if n is a prime number
isPrime :: Integer -> Bool
isPrime n
  -- don't worry about negative numbers
  | n < 2 = False
  | otherwise = all ((/= 0) . mod n) [2 .. isqrt n]
  where
    isqrt :: Integer -> Integer
    isqrt = roundDoubleInteger . sqrt . fromIntegral
