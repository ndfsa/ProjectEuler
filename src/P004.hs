module P004 (solve) where

import Data.List (tails)

-- converts an integer into an list of digits
digits :: Integer -> [Integer]
digits n = inner n []
  where
    inner :: Integer -> [Integer] -> [Integer]
    inner num acc
      | num == 0 = acc
      | otherwise = inner (div num 10) (mod num 10 : acc)

-- checks if a number is a palindrome by converting the number into a list of digits, reversing
-- it and checking the two arrays are the same
isPalindrome :: Integer -> Bool
isPalindrome n =
  digs == reverse digs
  where
    digs = digits n

solve :: IO ()
solve = do
  -- all three digit numbers
  let threeDig = [999, 998 .. 100]

  -- get all products of two three digit numbers
  let threeProd = [x * y | (x : rest) <- tails threeDig, y <- rest]

  -- filter numbers that are palindromes
  let palindromes = filter isPalindrome threeProd

  print $ maximum palindromes
