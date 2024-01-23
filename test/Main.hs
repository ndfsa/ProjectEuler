module Main (main) where

import P009 (solve)
import System.Exit (exitSuccess)

main :: IO ()
main = do
  print (solve ())
  exitSuccess
