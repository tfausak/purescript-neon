module Test.Neon.Types.HasMultiply where

import Neon
import Test.Core (Test(), (==>))

testHasMultiply :: Test
testHasMultiply = do
  multiply false true ==> false
  ((+ 2) * (+ 3)) 3 ==> 30
  2 * 3 ==> 6
  2.0 * 3.0 ==> 6.0
