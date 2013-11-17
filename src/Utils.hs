module Utils (
	pacmanlocation,
	nextlocation,
	setIndex,
	setMultiIndex
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
	| dir == 'L' = (x,y-1)
	| dir == 'R' = (x,y+1)
	| dir == 'U' = (x-1,y)
	| dir == 'D' = (x+1,y)
	where (x,y) = tuple

setIndex :: [a] -> Int -> a -> [a]
setIndex (_:xs) 0 val = val:xs
setIndex (x:xs) index val = x:(setIndex xs (index-1) val)

setMultiIndex :: [[a]] -> (Int, Int) -> a -> [[a]]
setMultiIndex xs (x, y) val = setIndex xs x row
	where row = setIndex (xs !! x) y val