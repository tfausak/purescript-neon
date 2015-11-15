module Test.Neon.Types.HasLift where

import Neon
import Test.Core (Test())

main :: Test
main = do
  info "Neon.Types.HasLift"
  -- This module does not define any instances.
  pure unit
