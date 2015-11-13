module Test.Neon.Types.HasTraverse where

import Neon
import Neon.Values
import Test.Core (Test(), (==>))

testHasTraverse :: Test
testHasTraverse = do
  info "Neon.Types.HasTraverse"
  traverse pure (Just 1) ==> [Just 1]
