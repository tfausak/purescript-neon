module Test.Neon.Types.HasBottom where

import Neon
import Neon.Values -- TODO: #45
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasBottom"
  bottom ==> false
  bottom unit ==> false
  bottom ==> 0 - 2147483648
  bottom ==> negate infinity
  bottom ==> LessThan
