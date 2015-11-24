module Test.Neon.Types.HasLogarithm where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasLogarithm"
  logarithm 2 8 ==> 3
  logarithm 2.0 8.0 ==> 3.0
