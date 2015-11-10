module Test.Neon.Types.HasLift where

import Neon
import Test.Core (Test())

testHasLift :: Test
testHasLift = do
  info "Neon.Types.HasLift"
  -- This module does not define any instances.
  pure unit
