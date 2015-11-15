module Test.Neon.Primitives.Char where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Primitives.Char"
  toLower 'A' ==> 'a'
  toUpper 'a' ==> 'A'
