module Utils (primes) where

-- -- checks if n is a prime number
-- isPrime :: Integer -> Bool
-- isPrime n = checkSieve n primes
--   where
--     checkSieve _ [] = False
--     checkSieve k (p : ps) =
--       case compare k p of
--         LT -> checkSieve k ps
--         EQ -> True
--         GT -> False

primes :: [Integer]
primes = [2, 3, 5] ++ diff [7, 9 ..] nonprimes
  where
    nonprimes :: [Integer]
    nonprimes = foldr1 f . map g . tail $ primes

    merge :: (Ord a) => [a] -> [a] -> [a]
    merge xs [] = xs
    merge [] ys = ys
    merge xs@(x : xt) ys@(y : yt) =
      case compare x y of
        LT -> x : merge xt ys
        EQ -> x : merge xt yt
        GT -> y : merge xs yt

    diff :: (Ord a) => [a] -> [a] -> [a]
    diff [] _ = []
    diff xs [] = xs
    diff xs@(x : xt) ys@(y : yt) =
      case compare x y of
        LT -> x : diff xt ys
        EQ -> diff xt yt
        GT -> diff xs yt

    f [] ys = ys
    f (x : xt) ys = x : merge xt ys
    g p = [n * p | n <- [p, p + 2 ..]]
