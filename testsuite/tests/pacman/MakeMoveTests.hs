module Pacman.MakeMoveTests
    ( tests
    ) where

import Test.Framework (Test, testGroup)
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit (Assertion, assert)
import     Pacman.MakeMove

tests :: Test
tests = testGroup "Pacman.MakeMoveTests"
    [ testCase "Test dummy" testDummy
    ]

testDummy :: Assertion
testDummy = assert $ True