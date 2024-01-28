module P016 (solve) where

import Data.Char (digitToInt)

solve :: IO ()
solve = do
  let digits = map digitToInt (show $ 2 ^ 1000)

  print $ sum digits
