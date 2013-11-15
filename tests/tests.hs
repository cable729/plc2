module Main
    ( main
    ) where

import Test.Tasty
import Test.Tasty.Golden

import Part1

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Empty" []
--tests = testGroup "Golden File Tests" [part1]

--part1 = test "Part 1" "..\data\output1_1.txt"

--part1Input :: String ()
--part1Input fileName = trymove 