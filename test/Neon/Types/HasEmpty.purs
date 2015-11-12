module Test.Neon.Types.HasEmpty where

import Neon
import Test.Core (Test(), (==>))

testHasEmpty :: Test
testHasEmpty = do
  info "Neon.Types.HasEmpty"
  empty ==> [] :: Array Unit
  guard false ==> [] :: Array Unit
  guard true ==> [unit]
