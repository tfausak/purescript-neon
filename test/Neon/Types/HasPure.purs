module Test.Neon.Types.HasPure where

import Neon
import Test.Core (Test(), (==>))

testHasPure :: Test
testHasPure = do
  info "Neon.Types.HasPure"
  pure 1 ==> [1]
  (pure 1 :: Unit -> Int) unit ==> 1