module Test.Main where

import Neon
import Test.Core
import Test.Neon.Effects
import Test.Neon.Primitives
import Test.Neon.Types
import Test.Neon.Values

main :: Test
main = do
  testEffects
  testPrimitives
  testTypes
  testValues

  info "✔︎ Tests passed."
