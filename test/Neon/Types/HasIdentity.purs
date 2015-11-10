module Test.Neon.Types.HasIdentity where

import Neon
import Test.Core (Test(), (==>))

testHasIdentity :: Test
testHasIdentity = do
  info "Neon.Types.HasIdentity"
  identity unit ==> unit
