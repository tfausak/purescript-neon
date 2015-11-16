module Test.Neon.Types.HasLogBase where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasLogBase"
  logBase 2 8 ==> 3
  logBase 2.0 8.0 ==> 3.0
