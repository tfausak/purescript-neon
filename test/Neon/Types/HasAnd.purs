module Test.Neon.Types.HasAnd where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasAnd"
  and true true ==> true
  true && true ==> true
  (identity && not) true ==> false
