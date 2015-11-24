module Test.Neon.Types.HasToArray where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasToArray"
  toArray "ab" ==> ['a', 'b']
