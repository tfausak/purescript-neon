module Test.Neon.Types.HasEqual where

import Neon
import Test.Core (Test(), (==>))

testHasEqual :: Test
testHasEqual = do
  info "Neon.Types.HasEqual"
  [1] == [1] ==> true
  equal true false ==> false
  'a' == 'a' ==> true
  (+ 1) == (+ 1) ==> false
  let f = (+ 1)
  f == f ==> true
  1 == 2 ==> false
  1.0 == 1.0 ==> true
  { k: "a" } == { k: "z" } ==> false
  "neon" == "neon" ==> true
  [pair unit true] == [pair unit true] ==> true
