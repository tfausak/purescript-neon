module Test.Neon.Primitives.Object where

import Neon
import Test.Core (Test())

main :: Test
main = do
  info "Neon.Primitives.Object"
  -- This module does not export anything.
  pure unit
