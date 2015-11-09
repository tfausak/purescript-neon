module Test.Neon.Types.HasSubtract where

import Neon
import Test.Core (Test(), (==>))

testHasSubtract :: Test
testHasSubtract = do
  ((+ 2) - (+ 1)) 3 ==> 1
  subtract 3 2 ==> 1
  3.0 - 2.0 ==> 1.0
  negate 1 ==> 0 - 1 -- NOTE: purescript/purescript#1591
