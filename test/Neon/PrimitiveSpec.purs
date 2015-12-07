module Test.Neon.PrimitiveSpec where

import Neon
import Test.Spec
import qualified Test.Neon.Primitive.ArraySpec as Array
import qualified Test.Neon.Primitive.BooleanSpec as Boolean
import qualified Test.Neon.Primitive.CharSpec as Char
import qualified Test.Neon.Primitive.FunctionSpec as Function
import qualified Test.Neon.Primitive.IntSpec as Int
import qualified Test.Neon.Primitive.NumberSpec as Number
import qualified Test.Neon.Primitive.ObjectSpec as Object
import qualified Test.Neon.Primitive.StringSpec as String

spec :: Spec
spec = describe "Neon.Primitive" do
  Array.spec
  Boolean.spec
  Char.spec
  Function.spec
  Int.spec
  Number.spec
  Object.spec
  String.spec
