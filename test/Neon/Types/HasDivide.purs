module Test.Neon.Types.HasDivide where

import Neon
import Test.Core (Test(), (==>))

testHasDivide :: Test
testHasDivide = do
  info "Neon.Types.HasDivide"
  ((+ 2) / (\ x -> x - 3)) 8 ==> 2
  ((+ 2) % (\ x -> x - 3)) 8 ==> 0
  divide 5 2 ==> 2
  modulo 5 2 ==> 1
  5.0 / 2.0 ==> 2.5
  5.0 % 2.0 ==> 0.0
  reciprocal 2 ==> 0
  reciprocal 2.0 ==> 0.5
