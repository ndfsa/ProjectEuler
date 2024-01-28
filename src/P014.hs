module P014 (solve) where

import Data.Foldable (maximumBy)
import Data.Ord (comparing)

-- calculate the length of the collatz sequence
-- fast enough to not require memoization
collatzLength :: Int -> Int
collatzLength = optimizedCollatz 0
  where
    optimizedCollatz :: Int -> Int -> Int
    optimizedCollatz acc 1 = acc
    optimizedCollatz acc n
      | even n = optimizedCollatz (acc + 1) (div n 2)
      | otherwise = optimizedCollatz (acc + 2) (div (3 * n + 1) 2)

solve :: IO ()
solve = do
  -- get the list of tuples containing the first element and the length of the sequence
  let lengths = map (\n -> (n, collatzLength n)) [1 .. 1_000_000]

  print $ fst . maximumBy (comparing snd) $ lengths
