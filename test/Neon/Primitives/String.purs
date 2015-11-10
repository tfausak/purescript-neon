module Test.Neon.Primitives.String where

import Neon
import Test.Core (Test(), (==>))

testString :: Test
testString = do
  info "Neon.Primitives.String"
  fromCharArray ['a', 'b'] ==> "ab"
  toCharArray "ab" ==> ['a', 'b']
