module Test.Neon.Primitives.String where

import Neon
import Test.Core (Test(), (==>))

testString :: Test
testString = do
  fromCharArray ['a', 'b'] ==> "ab"
  toCharArray "ab" ==> ['a', 'b']
