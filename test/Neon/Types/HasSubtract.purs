module Test.Neon.Types.HasSubtract where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasSubtract"
  ((+ 2) - (+ 1)) 3 ==> 1
  subtract 3 2 ==> 1
  3.0 - 2.0 ==> 1.0
  negate 1 ==> -1
  abs 2 ==> 2
  abs (-2) ==> 2
