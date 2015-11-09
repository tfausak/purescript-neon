module Test.Neon.Values where

import Neon
import Test.Core (Test())
import Test.Neon.Values.Either (testEither)
import Test.Neon.Values.Identity (testIdentity)
import Test.Neon.Values.Maybe (testMaybe)
import Test.Neon.Values.Ordering (testOrdering)
import Test.Neon.Values.Pair (testPair)
import Test.Neon.Values.Unit (testUnit)

testValues :: Test
testValues = do
  testEither
  testIdentity
  testMaybe
  testOrdering
  testPair
  testUnit
