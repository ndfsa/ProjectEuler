module P014 (solve) where

import Data.Foldable (maximumBy)
import Data.Ord (comparing)

-- calculate the length of the collatz sequence
-- fast enough, it does not need memoization
collatzLength :: Int -> Int
collatzLength = collatz 0
  where
    collatz :: Int -> Int -> Int
    collatz acc 1 = acc
    collatz acc n
      | even n = collatz (acc + 1) (div n 2)
      | otherwise = collatz (acc + 2) (div (3 * n + 1) 2)

solve :: IO ()
solve = do
  -- get the list of tuples containing the first element and the length of the sequence
  let lengths = map (\n -> (n, collatzLength n)) [1 .. 1_000_000]

  print $ fst . maximumBy (comparing snd) $ lengths
