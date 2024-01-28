module Memoization (memoize) where

-- memoization strategy
memoize :: (Integer -> a) -> (Integer -> a)
memoize f = (map f [0 ..] !!) . fromIntegral
