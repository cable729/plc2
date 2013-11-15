import Prelude
import System.Environment ( getArgs )
import Data.List
import Data.Maybe
import Part1

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