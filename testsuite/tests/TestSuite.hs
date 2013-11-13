module Main
    ( main
    ) where

import           Test.Framework        (defaultMain)

import qualified Pacman.MakeMove.Tests

main :: IO ()
main = defaultMain
    [ Pacman.MakeMove.Tests.tests
    ]
