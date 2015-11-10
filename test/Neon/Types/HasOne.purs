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
