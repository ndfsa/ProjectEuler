module Main (main) where

import P011 (solve)
import System.Exit (exitSuccess)

main :: IO ()
main = do
  print (solve ())
  exitSuccess
