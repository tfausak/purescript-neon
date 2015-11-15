module Test.Neon.Types.HasOr where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasOr"
  or false true ==> true
  false || true ==> true
  (identity || not) false ==> true
