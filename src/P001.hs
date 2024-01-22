module P001 (solve) where

-- checks if d is a divisor of n
divides :: Integer -> Integer -> Bool
divides d n = mod n d == 0

solve :: () -> Integer
solve = do
  -- get the multiples of 3 or 5
  let multiples = filter (\x -> divides 3 x || divides 5 x) [1 ..]

  -- get the items less than 1000
  let limit = takeWhile (< 1000) multiples

  return (sum limit)
