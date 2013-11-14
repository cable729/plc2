module Main
    ( main
    ) where

import Test.Framework (defaultMain)
import qualified Pacman.UtilsTests
import qualified Pacman.MakeMoveTests


main :: IO ()

main = defaultMain
    [ Pacman.MakeMoveTests.tests,
    Pacman.UtilsTests.tests
    ]