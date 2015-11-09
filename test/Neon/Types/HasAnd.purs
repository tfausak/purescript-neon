module Test.Neon.Types.HasAnd where

import Neon
import Test.Core (Test(), (==>))

testHasAnd :: Test
testHasAnd = do
  and true true ==> true
  true && true ==> true
  (identity && not) true ==> false
