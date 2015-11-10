module Test.Neon.Primitives.Number where

import Neon
import Test.Core (Test())

testNumber :: Test
testNumber = do
  info "Neon.Primitives.Number"
  -- This module does not export anything.
  pure unit
