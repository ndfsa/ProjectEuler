module P009 (solve) where

-- list of all primitive pythagorean triples
pyTriples :: [(Int, Int, Int)]
pyTriples = map (last . snd) inner
  where
    inner :: [(Int, [(Int, Int, Int)])]
    inner = iterate nextTriple (3, [(3, 4, 5)])

-- iteration function for next pythagorean triple, using tree of primitive pythagorean triples
-- method
nextTriple ::
  (Int, [(Int, Int, Int)]) ->
  (Int, [(Int, Int, Int)])
nextTriple (count, queue)
  | count > 0 = (count - 1, queue ++ [pyTransform count (head queue)])
  | otherwise = (3, tail queue)

-- linear transformations for the nextTriple function
pyTransform :: Int -> (Int, Int, Int) -> (Int, Int, Int)
pyTransform n (a, b, c)
  | n == 3 = (2 * a + b - c, -2 * a + 2 * b + 2 * c, -2 * a + b + 3 * c)
  | n == 2 = (2 * a + b + c, 2 * a - 2 * b + 2 * c, 2 * a - b + 3 * c)
  | n == 1 = (2 * a - b + c, 2 * a + 2 * b + 2 * c, 2 * a + b + 3 * c)
  | otherwise = (0, 0, 0)

solve :: IO ()
solve = do
  -- all triples for which their sum divides 1000 evenly (there should only be one)
  let acceptedTriples = dropWhile (\(x, y, z) -> mod 1000 (x + y + z) /= 0) pyTriples

  -- solution triple
  let (x, y, z) = head acceptedTriples

  -- coefficient of primitive triple
  let c = div 1000 (x + y + z)

  print $ x * y * z * c ^ (3 :: Integer)
