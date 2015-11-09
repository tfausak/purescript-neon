module Test.Neon.Effects where

import Neon
import Test.Core (Test())
import Test.Neon.Effects.Console (testConsole)
import Test.Neon.Effects.Effect (testEffect)
import Test.Neon.Effects.Exception (testException)
import Test.Neon.Effects.Random (testRandom)

testEffects :: Test
testEffects = do
  testConsole
  testEffect
  testException
  testRandom
