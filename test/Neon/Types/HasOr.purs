module Test.Neon.Types.HasOr where

import Neon
import Test.Core (Test(), (==>))

testHasOr :: Test
testHasOr = do
  info "Neon.Types.HasOr"
  or false true ==> true
  false || true ==> true
  (identity || not) false ==> true