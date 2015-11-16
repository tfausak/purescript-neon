module Test.Neon.Types.HasNot where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasNot"
  not true ==> false
  not (always false) unit ==> true
  notEqual 1 2 ==> true
  1 != 2 ==> true
