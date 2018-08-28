module Main where

import Control.Parallel.Strategies hiding (parList, evalList)

evalList :: Strategy a -> Strategy [a]
evalList strat [] = return []
evalList strat (x:xs) = do
    x'  <- strat x
    xs' <- evalList strat xs
    return (x', xs')

parList :: Strategy a -> Strategy [a]
parList strat = evalList (rparWith strat)

-- ----------------
-- go to /Chapter02/Sudoku5.hs to view updated Sudoku following learning this.
