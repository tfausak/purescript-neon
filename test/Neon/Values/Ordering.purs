module Test.Neon.Values.Ordering where

import Neon
import Neon.Values -- NOTE: purescript/purescript#1594
import Test.Core (Test(), (==>))

testOrdering :: Test
testOrdering = do
  compare LessThan GreaterThan ==> LessThan
  LessThan == GreaterThan ==> false
  show EqualTo ==> "EqualTo"
