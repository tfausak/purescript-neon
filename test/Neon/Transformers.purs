module Test.Neon.Transformers where

import Neon
import Test.Core (Test())
import Test.Neon.Transformers.MaybeT (testMaybeT)
import Test.Neon.Transformers.StateT (testStateT)

testTransformers :: Test
testTransformers = do
  testMaybeT
  testStateT
