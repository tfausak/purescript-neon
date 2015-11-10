module Test.Neon.Types.HasZero where

import Neon
import Test.Core (Test(), (==>))

testHasZero :: Test
testHasZero = do
  info "Neon.Types.HasZero"
  zero ==> [] :: Array Unit
  zero ==> false
  zero unit ==> 0
  zero ==> 0
  zero ==> 0.0
  zero ==> ""