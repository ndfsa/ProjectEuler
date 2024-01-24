module P002 (solve) where

-- fibonacci sequence
fibSequence :: [Integer]
fibSequence = map fst (iterate (\(a, b) -> (b, a + b)) (1, 2))

solve :: () -> Integer
solve = do
  -- get only the even numbers
  let evenFib = filter even fibSequence

  -- take items strictly less than 4_000_000
  let limit = takeWhile (< 4_000_000) evenFib

  return (sum limit)
