module Test.Neon.Values.Ordering where

import Neon
import Neon.Values -- TODO: #45
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Values.Ordering"
  compare LessThan GreaterThan ==> LessThan
  LessThan == GreaterThan ==> false
  show EqualTo ==> "EqualTo"
