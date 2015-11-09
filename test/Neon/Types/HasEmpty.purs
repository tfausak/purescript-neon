module Test.Neon.Types.HasEmpty where

import Neon
import Test.Core (Test(), (==>))

testHasEmpty :: Test
testHasEmpty = do
  empty ==> [] :: Array Unit
