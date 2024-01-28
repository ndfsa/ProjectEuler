module PrimeNumbers (primes, isPrime, pdecompose) where

-- checks if n is a prime number
isPrime :: (Integral a) => a -> Bool
isPrime n = checkSieve primes
  where
    checkSieve [] = False
    checkSieve (p : ps) =
      case compare n p of
        LT -> False
        EQ -> True
        GT -> checkSieve ps

primes :: (Integral a) => [a]
primes = [2, 3, 5] ++ diff [7, 9 ..] nonprimes
  where
    -- infinite list of *odd* non-prime numbers
    nonprimes :: (Integral a) => [a]
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

pdecompose :: (Integral a) => a -> [a]
pdecompose n
  | n <= 1 = []
  | otherwise = reverse $ inner n primes [1]
  where
    inner _ [] _ = []
    inner _ _ [] = []
    inner k lp@(hp : tp) acc
      | isPrime k = k : acc
      | mod k hp == 0 = inner (div k hp) lp (hp : acc)
      | otherwise = inner k tp acc
