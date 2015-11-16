module Test.Neon.Types.HasEmpty where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasEmpty"
  empty ==> [] :: Array Unit
  guard false ==> [] :: Array Unit
  guard true ==> [unit]
