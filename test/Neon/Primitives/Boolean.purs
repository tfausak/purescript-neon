module Test.Neon.Primitives.Boolean where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Primitives.Boolean"
  otherwise ==> true
  boolean 1 2 true ==> 1
