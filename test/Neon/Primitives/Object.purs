module Test.Neon.Primitives.Object where

import Neon
import Test.Core (Test())

testObject :: Test
testObject = do
  info "Neon.Primitives.Object"
  -- This module does not export anything.
  pure unit
