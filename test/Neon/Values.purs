module Test.Neon.Values where

import Neon
import Test.Core (Test())
import Test.Neon.Values.Dictionary (testDictionary)
import Test.Neon.Values.Either (testEither)
import Test.Neon.Values.Identity (testIdentity)
import Test.Neon.Values.Maybe (testMaybe)
import Test.Neon.Values.Ordering (testOrdering)
import Test.Neon.Values.Pair (testPair)
import Test.Neon.Values.These (testThese)
import Test.Neon.Values.Unit (testUnit)

testValues :: Test
testValues = do
  info "Neon.Values"
  testDictionary
  testEither
  testIdentity
  testMaybe
  testOrdering
  testPair
  testThese
  testUnit
