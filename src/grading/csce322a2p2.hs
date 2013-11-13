import Prelude
import System.Environment ( getArgs )
import Data.List
import Data.Maybe

-- The main method that will be used for testing / command line access
main = do
	args <- getArgs
	pacFile <- readFile (head args)
	map <- mapList pacFile
	let
		pac = map
		in yourMain pac

partTwoOutput :: [[Char]] -> IO ()
partTwoOutput pac = do
	print pac

-- Converts a string to a tuple representing the pac-man map
mapList :: String -> IO [[Char]]
mapList = readIO




-- YOUR CODE SHOULD COME AFTER THIS POINT

-- yourMain
yourMain pac =
	partTwoOutput $ replace pac

--replace :: [[Char]] -> [[Char]]
