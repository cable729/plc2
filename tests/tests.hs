module Main
    (
    	main
    ) where

import Test.Tasty
import Test.Tasty.Golden

import Functions

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Empty" []
--tests = testGroup "Golden File Tests" [part1]

--part1 = test "Part 1" "..\data\output1_1.txt"

--let 
--goldenVsString "Part 1"


--type Part1Input = (Int, Int, Int, [[Char]], Char)
--runPart1 :: FilePath -> String
--runPart1 file = let input =	do
--	contents <- readFile file;
--	return read contents;
--	in trymove input