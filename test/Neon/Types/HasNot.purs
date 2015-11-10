module Test.Neon.Types.HasNot where

import Neon
import Test.Core (Test(), (==>))

testHasNot :: Test
testHasNot = do
  info "Neon.Types.HasNot"
  not true ==> false
  not (constant false) unit ==> true
  notEqual 1 2 ==> true
  1 != 2 ==> true
