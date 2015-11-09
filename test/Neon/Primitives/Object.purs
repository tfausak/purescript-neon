module Test.Neon.Primitives.Object where

import Neon
import Test.Core (Test())

testObject :: Test
testObject = do
  -- This module does not export anything.
  pure unit
