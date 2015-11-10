module Test.Neon.Primitives.Number where

import Neon
import Test.Core (Test(), (==>))

testNumber :: Test
testNumber = do
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
  round (negate 0.5) ==> 0
  ceiling 0.5 ==> 1
  ceiling (negate 0.5) ==> 0
  floor 0.5 ==> 0
  floor (negate 0.5) ==> negate 1
  truncate 0.5 ==> 0
  truncate (negate 0.5) ==> 0
