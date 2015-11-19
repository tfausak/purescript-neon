module Test.Neon.Primitives.Number where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Primitives.Number"
  isFinite infinity ==> false
  isFinite 1.0 ==> true
  isInfinite infinity ==> true
  isInfinite 1.0 ==> false
  infinity ==> 1.0 / 0.0
  0.0 - infinity ==> (0.0 - 1.0) / 0.0
  isNaN (0.0 / 0.0) ==> true
  isNaN 1.0 ==> false
  nan == nan ==> false
  round 0.5 ==> 1
  round (-0.5) ==> 0
  ceiling 0.5 ==> 1
  ceiling (-0.5) ==> 0
  floor 0.5 ==> 0
  floor (-0.5) ==> -1
  truncate 0.5 ==> 0
  truncate (-0.5) ==> 0
