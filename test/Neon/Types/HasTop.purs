module Test.Neon.Types.HasTop where

import Neon
import Neon.Values -- NOTE: purescript/purescript#1594
import Test.Core (Test(), (==>))

testHasTop :: Test
testHasTop = do
  info "Neon.Types.HasTop"
  top ==> true
  top ==> '\65535'
  top unit ==> true
  top ==> 2147483647
  top ==> GreaterThan
