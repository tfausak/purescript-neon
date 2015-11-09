module Test.Neon.Types.HasIdentity where

import Neon
import Test.Core (Test(), (==>))

testHasIdentity :: Test
testHasIdentity = do
  identity unit ==> unit
