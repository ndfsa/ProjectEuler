module P017 (solve) where

-- get literal without spaces or special characters
literal :: Int -> String
literal n
  | n < 20 = units !! n
  | n < 100 = tens !! div n 10 ++ literal (mod n 10)
  | n == 100 = "onehundred"
  | n < 1000 && mod n 100 == 0 = units !! div n 100 ++ "hundred"
  | n < 1000 = units !! div n 100 ++ "hundredand" ++ literal (mod n 100)
  | n == 1000 = "onethousand"
  | otherwise = error "Unsupported"
  where
    units =
      [ "",
        "one",
        "two",
        "three",
        "four",
        "five",
        "six",
        "seven",
        "eight",
        "nine",
        "ten",
        "eleven",
        "twelve",
        "thirteen",
        "fourteen",
        "fifteen",
        "sixteen",
        "seventeen",
        "eighteen",
        "nineteen"
      ]
    tens = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

solve :: IO ()
solve = do
  print $ sum $ map (length . literal) [1 .. 1000]
