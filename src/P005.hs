module P005 (solve) where

solve :: IO ()
solve = do
  -- numbers to use
  let nums = [1 .. 20]

  -- get the lcm of all the numbers
  print $ foldl1 lcm nums
