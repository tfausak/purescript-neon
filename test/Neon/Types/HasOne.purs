module Test.Neon.Types.HasOne where

import Neon
import Test.Core (Test(), (==>))

testHasOne :: Test
testHasOne = do
  info "Neon.Types.HasOne"
  one ==> true
  one unit ==> 1
  one ==> 1
  one ==> 1.0
  sign 2 ==> 1
  sign 0 ==> 0
  sign (negate 2) ==> negate 1
