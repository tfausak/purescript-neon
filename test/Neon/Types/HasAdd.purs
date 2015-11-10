module Test.Neon.Types.HasAdd where

import Neon
import Test.Core (Test(), (==>))

testHasAdd :: Test
testHasAdd = do
  info "Neon.Types.HasAdd"
  [1] + [2] ==> [1, 2]
  add true true ==> true
  ((+ "!") + (+ "?")) "Eh" ==> "Eh!Eh?"
  1 + 2 ==> 3
  1.0 + 2.0 ==> 3.0
  "1" + "2" ==> "12"
