module Test.Neon.Types.HasPower
  ( testHasPower
  ) where

import Neon
import Test.Core (Test(), (==>))

testHasPower :: Test
testHasPower = do
  info "Neon.Types.HasPower"
  power 2 3 ==> 8
  2 ^ (0 - 1) ==> 0
  power 2.0 3.0 ==> 8.0
  2.0 ^ (0.0 - 1.0) ==> 0.5
