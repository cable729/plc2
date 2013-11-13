import Prelude
import System.Environment ( getArgs )
import Data.List
import Data.Maybe

-- The main method that will be used for testing / command line access
main = do
	args <- getArgs
	pacFile <- readFile (head args)
	map <- mapTuple pacFile
	let
		pac = map
		in yourMain pac

partOneOutput :: (Int, Int, Int, [[Char]]) -> IO ()
partOneOutput pac = do
	print pac

-- Converts a string to a tuple representing the pac-man map
mapTuple :: String -> IO (Int, Int, Int, [[Char]], Char)
mapTuple = readIO




-- YOUR CODE SHOULD COME AFTER THIS POINT

-- yourMain
yourMain pac =
	partOneOutput $ trymove pac

--1. If the move to make will cause Pac-Man to collide with a wall or border, the move is not
--made and the map is not altered
--2. If the move to make will cause Pac-Man to enter a cell occupied by a ghost (or ghost and
--food, or ghost and power pellet), the number of lives that Pac-Man has is reduced by 1. The
--score and map are not altered.
--3. If the move to make will cause Pac-Man to enter a cell occupied only by food, move Pac-
--Man into that cell (leaving behind an empty cell) and increase the score by 1.
--4. If the move to make will cause Pac-Man to enter a cell occupied only by a power pellet, move
--Pac-Man into that cell (leaving behind an empty cell) and increase the score by 10.

--This method will take a level, score, lives, map, and move to make, and return a level, score, lives, and map
trymove :: (Int, Int, Int, [[Char]], Char) -> (Int, Int, Int, [[Char]])



pacmanLine :: [[Char]] -> n
pacmanLine xs = fromJust findIndex ('M' `elem`) xs
-- Here we assume that there is a pacman character