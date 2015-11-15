module Test.Neon.Primitives.Int where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Primitives.Int"
  toNumber 1 ==> 1.0
