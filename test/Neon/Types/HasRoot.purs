module Test.Neon.Types.HasRoot where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasRoot"
  root 2 9 ==> 3
  root 2.0 9.0 ==> 3.0
