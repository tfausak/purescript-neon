module Test.Neon.Types.HasFromArray where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasFromArray"
  fromArray ['a', 'b'] ==> "ab"
