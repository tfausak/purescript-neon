module Test.Neon.Effects.Random where

import Neon
import Test.Core (Test(), (==>))

testRandom :: Test
testRandom = do
  ((>= 0.0) && (< 1.0)) (unsafeRunEffect randomNumber) ==> true
