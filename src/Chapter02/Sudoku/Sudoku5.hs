module Main where

import Control.Exception
import Control.Parallel.Strategies
import Data.Maybe
import Sudoku
import System.Environment

-- -------------
-- this is part of Chapter 03

main :: IO ()
main = do
  [f] <- getArgs
  file <- readFile f

  let puzzles   = lines file
      solutions = map solve puzzles `using` parList rseq

  print (length (filter isJust solutions))
