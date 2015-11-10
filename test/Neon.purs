module Test.Neon where

import Neon
import Test.Core (Test())
import Test.Neon.Effects (testEffects)
import Test.Neon.Primitives (testPrimitives)
import Test.Neon.Transformers (testTransformers)
import Test.Neon.Types (testTypes)
import Test.Neon.Values (testValues)

testNeon :: Test
testNeon = do
  info "Neon"
  testEffects
  testPrimitives
  testTransformers
  testTypes
  testValues
