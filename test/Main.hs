module Main (main) where

import P007 (solve)
import System.Exit (exitSuccess)

main :: IO ()
main = do
  print (solve ())
  exitSuccess
