module Test.Neon.Primitives.Char where

import Neon
import Test.Core (Test(), (==>))

testChar :: Test
testChar = do
  toLower 'A' ==> 'a'
  toUpper 'a' ==> 'A'
