module Test.Neon.Types.HasTop where

import Neon
import Neon.Values -- TODO: #45
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasTop"
  top ==> true
  top ==> '\65535'
  top unit ==> true
  top ==> 2147483647
  top ==> infinity
  top ==> GreaterThan
