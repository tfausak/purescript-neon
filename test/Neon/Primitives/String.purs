module Test.Neon.Primitives.String where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Primitives.String"
  toCharArray "ab" ==> ['a', 'b']
