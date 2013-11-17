module Part1 (
	trymove
	) where

import Utils

--1. If the move to make will cause Pac-Man to collide with a wall or border, the move is not
--made and the map is not altered
--2. If the move to make will cause Pac-Man to enter a cell occupied by a ghost (or ghost and
--food, or ghost and power pellet), the number of lives that Pac-Man has is reduced by 1. The
--score and map are not altered.
--3. If the move to make will cause Pac-Man to enter a cell occupied only by food, move Pac-
--Man into that cell (leaving behind an empty cell) and increase the score by 1.
--4. If the move to make will cause Pac-Man to enter a cell occupied only by a power pellet, move
--Pac-Man into that cell (leaving behind an empty cell) and increase the score by 10.
--The tuple represents the level, score, lives, map and move list
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
