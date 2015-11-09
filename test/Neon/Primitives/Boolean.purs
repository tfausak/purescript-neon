module Test.Neon.Primitives.Boolean where

import Neon
import Test.Core (Test(), (==>))

testBoolean :: Test
testBoolean = do
  otherwise ==> true
