module P005 (solve) where

solve :: () -> Integer
solve = do
  -- numbers to use
  let nums = [1 .. 20]

  -- get the lcm of all the numbers
  return (foldl1 lcm nums)
