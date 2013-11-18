module Functions (
	trymove,
	replace,
	restart
	) where

import Utils
import qualified Data.List.Utils as H


trymove :: (Int, Int, Int, [[Char]], Char) -> (Int, Int, Int, [[Char]])
trymove (level, score, lives, themap, move) =
	let pacmanLoc = pacmanlocation themap
	    nextLoc = nextlocation pacmanLoc move
	    nextType = themap !! fst nextLoc !! snd nextLoc
	    foodMap = setMultiIndex (setMultiIndex themap nextLoc 'M') pacmanLoc '_'
    in case nextType of
    	'B' -> (level, score, lives, themap) -- doesn't move pacman if he tries to go into the border
    	'W' -> (level, score, lives, themap) -- doesn't move pacman if he tries to go into the border
    	'G' -> (level, score, lives - 1, themap) -- reduces the life and doesn't move pacman if he runs into a ghost
    	'F' -> (level, score + 1, lives, foodMap)
    	'P' -> (level, score + 10, lives, foodMap)
    	'_' -> (level, score, lives, foodMap)


replace :: [[Char]] -> [[Char]]
replace m =
	let
		noPac = map (\ x -> H.replace "M" "_" x) m
		andNoGhostAndFood = map (\ x -> H.replace "6" "F" x) noPac
		andNoGhostAndPowerPellets = map (\ x -> H.replace "R" "P" x) andNoGhostAndFood

		middle = (length m `div` 2, length (m !! 0) `div` 2)

		andPacPutBack = setMultiIndex andNoGhostAndPowerPellets (fst middle + 2, snd middle) 'M'
		and2Ghosts = setMultiIndex
		 				(setMultiIndex andPacPutBack middle 'G') (fst middle - 1, snd middle) 'G'
		and4Ghosts = setMultiIndex
		 				(setMultiIndex and2Ghosts (fst middle, snd middle - 1) 'G') (fst middle, snd middle + 1) 'G'		

	in
		and4Ghosts

restart :: [[Char]] -> [[Char]]
restart m =
	let
		m2 = replace m
		size = (length m, length (m !! 0))
		and2Pellets = setMultiIndex	(setMultiIndex m2 (1, 1) 'P') (1, snd size - 2) 'P'
		and4Pellets = setMultiIndex	(setMultiIndex and2Pellets (fst size - 2, 1) 'P') (fst size - 2, snd size - 2) 'P'
		andFood = map (\ x -> H.replace "_" "F" x) and4Pellets
	in
		andFood

makemove :: (Int, Int, Int, [[Char]], [Char]) -> (Int, Int, Int, [[Char]])
makemove (level, score, lives, m, []) = (level, score, lives, m)
makemove (level, score, lives, m, x:xs) ==
	let
		(level2, score2, lives2, m2) = trymove (level, score, lives, m, x)
	    
		pacloc = pacmanlocation m
		next = nextlocation pacloc x
		count = (countInMultiArray m 'F') + (countInMultiArray m 'P')
		nextType = if (count == 0) then 'X' else m !! fst next !! snd next

   	in case nextType of
   		 'G' -> makemove (level2, score2, lives2 - 1, restart m2, xs)
   		 'X' -> makemove (level2 + 1, score2, lives2, restart m2, xs)
   		 _  -> makemove (level2, score2, lives2, m2, xs)
   	

--moveall :: (Int, Int, Int, [[Char]], Char) -> (Int, Int, Int, [[Char]])
--moveall (level, score, lives, [], _) = (level, score, lives, [])
--moveall (level, score, lives, m, move) = 