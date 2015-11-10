module Test.Neon.Primitives.Char where

import Neon
import Test.Core (Test(), (==>))

testChar :: Test
testChar = do
  info "Neon.Primitives.Char"
  toLower 'A' ==> 'a'
  toUpper 'a' ==> 'A'
