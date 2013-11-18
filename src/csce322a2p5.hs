import Prelude
import System.Environment ( getArgs )
import Data.List
import Data.Maybe
import Functions(moveall)

-- The main method that will be used for testing / command line access
main = do
	args <- getArgs
	pacFile <- readFile (head args)
	map <- mapTuple pacFile
	let
		pac = map
		in yourMain pac

partFiveOutput :: (Int, Int, Int, [[Char]]) -> IO ()
partFiveOutput pac = do
	print pac

-- Converts a string to a tuple representing the pac-man map
mapTuple :: String -> IO (Int, Int, Int, [[Char]], [Char])
mapTuple = readIO




-- YOUR CODE SHOULD COME AFTER THIS POINT

-- yourMain
yourMain pac =
	partFiveOutput $ moveall pac

--moveall :: (Int, Int, Int, [[Char]], [Char]) -> (Int, Int, Int, [[Char]])
