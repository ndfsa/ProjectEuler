module P006 (solve) where

import Data.List (tails)

solve :: IO ()
solve = do
  -- numbers to test
  let nums = [1 .. 100]

  -- get every combination of each number without repetition
  let twoComb = [x * y | x : tl <- tails nums, y <- tl]

  -- sum all numbers and multiply by 2
  print $ sum twoComb * (2 :: Int)
