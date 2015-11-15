module Test.Neon.Primitives where

import Neon
import Test.Core (Test())
import qualified Test.Neon.Primitives.Array as Array
import qualified Test.Neon.Primitives.Boolean as Boolean
import qualified Test.Neon.Primitives.Char as Char
import qualified Test.Neon.Primitives.Function as Function
import qualified Test.Neon.Primitives.Int as Int
import qualified Test.Neon.Primitives.Number as Number
import qualified Test.Neon.Primitives.Object as Object
import qualified Test.Neon.Primitives.String as String

main :: Test
main = do
  info "Neon.Primitives"
  Array.main
  Boolean.main
  Char.main
  Function.main
  Int.main
  Number.main
  Object.main
  String.main
