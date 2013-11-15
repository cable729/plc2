module Utils (
	pacmanlocation,
	nextlocation
	) where

import Prelude
import Data.List (findIndex, elemIndex)
import Data.Maybe (fromJust)

pacmanlocation :: [[Char]] -> (Int, Int)
pacmanlocation xs = (row, fromJust $ elemIndex 'M' (xs!!row))
	where row = fromJust $ findIndex ('M' `elem`) xs
-- Here we assume that there is a pacman character

nextlocation :: (Int, Int) -> Char -> (Int, Int)
nextlocation tuple dir
	| dir == 'L' = (x-1,y)
	| dir == 'R' = (x+1,y)
	| dir == 'U' = (x,y-1)
	| dir == 'D' = (x,y+1)
	where (x,y) = tuple