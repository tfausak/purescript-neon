module Test.Neon.Types.HasState where

import Neon
import Test.Core (Test())

testHasState :: Test
testHasState = do
  info "Neon.Types.HasState"
  -- This module does not define any instances.
  pure unit
