module Test.Neon.PrimitiveSpec where

import Test.Helper
import Test.Neon.Primitive.ArraySpec as Array
import Test.Neon.Primitive.BooleanSpec as Boolean
import Test.Neon.Primitive.CharSpec as Char
import Test.Neon.Primitive.FunctionSpec as Function
import Test.Neon.Primitive.IntSpec as Int
import Test.Neon.Primitive.NumberSpec as Number
import Test.Neon.Primitive.ObjectSpec as Object
import Test.Neon.Primitive.StringSpec as String

spec :: Spec
spec = describe "Primitive" do
  Array.spec
  Boolean.spec
  Char.spec
  Function.spec
  Int.spec
  Number.spec
  Object.spec
  String.spec
