module Test.Neon.Types.HasBottom where

import Neon
import Neon.Values -- NOTE: purescript/purescript#1594
import Test.Core (Test(), (==>))

testHasBottom :: Test
testHasBottom = do
  info "Neon.Types.HasBottom"
  bottom ==> false
  -- bottom ==> '\0' -- NOTE: purescript/purescript#1602
  bottom unit ==> false
  bottom ==> 0 - 2147483648 -- NOTE: purescript/purescript#1591
  bottom ==> LessThan
